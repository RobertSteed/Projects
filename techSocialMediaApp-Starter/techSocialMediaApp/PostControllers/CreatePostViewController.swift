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
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    //
    //    func editingPosts() async {
    //        let body = bodyTextField.text ?? ""
    //        let title = titleTextField.text ?? ""
    //        Task {
    //            try! await editingPostsOnServer.userEditPost(postid: title: body:)
    //        }
    //    }
    //
    
    
    @IBAction func postButtonTapped(_ sender: Any) {
        let body = bodyTextField.text ?? ""
        let title = titleTextField.text ?? ""
        Task {
            
            
            if let post = post {
                //edit the post
                var editedPost = post
                editedPost.body = body
                editedPost.title = title
                
                DispatchQueue.main.async {
                    self.delegate?.postEdited(editedPost)
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
}
    
    
    
    


