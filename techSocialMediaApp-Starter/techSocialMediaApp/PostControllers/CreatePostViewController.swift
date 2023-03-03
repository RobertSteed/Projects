//
//  CreatePostViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/9/23.
//

import UIKit

protocol CreatePostViewControllerDelegate: AnyObject {
    func postEdited(_ post: Post)
    func postCreated(_ post: Post)
}


class CreatePostViewController: UIViewController {
    
    init?(coder: NSCoder, post: Post?) {
        self.post = post
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currentUser = User.current
    
    var post: Post?
    
    var sendingPostToServer = PostInformation()
    var editingPostsOnServer = DeleteEditPosts()
    weak var delegate: CreatePostViewControllerDelegate?
    
    
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post {
            bodyTextField.text = post.body
            titleTextField.text = post.title
        }
    }
    
//        func editingPosts() async {
//            let body = bodyTextField.text ?? ""
//            let title = titleTextField.text ?? ""
//            Task {
//                try! await editingPostsOnServer.userEditPost(postid: post!.postid, title: title, body: body)
//            }
//        }
    
    
    
    @IBAction func postButtonTapped(_ sender: Any) {
        let body = bodyTextField.text ?? ""
        let title = titleTextField.text ?? ""
        Task {
            if var editedPost = post {
                editedPost.body = body
                editedPost.title = title
                
                Task {
//                    await editingPosts()
                    try? await editingPostsOnServer.userEditPost(postid: post!.postid, title: title, body: body)
                    DispatchQueue.main.async {
                        self.delegate?.postEdited(editedPost)
                    }
                }
               
                
            } else {
                //new post
                try! await sendingPostToServer.userPostingInformation(title: title, body: body)
                
                let newPost = Post(postid: 0, title: title, body: body, authorUserName: currentUser!.userName, authorUserId: currentUser!.userUUID.uuidString, likes: 0, userLiked: false, numComments: 0, createdDate: Date().ISO8601Format())
                
                DispatchQueue.main.async {
                    self.delegate?.postCreated(newPost)
                }
            }
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editPosts" else { return }
        
        let body = bodyTextField.text ?? ""
        let title = titleTextField.text ?? ""
        
        post = Post(postid: post!.postid, title: post!.title, body: post!.body, authorUserName: post!.authorUserName, authorUserId: post!.authorUserId, likes: post!.likes, userLiked: post!.userLiked, numComments: post!.numComments, createdDate: post!.createdDate)
    }
}
    
    
        
    


