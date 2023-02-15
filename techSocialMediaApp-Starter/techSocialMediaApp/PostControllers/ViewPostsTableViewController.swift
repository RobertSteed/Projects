//
//  AddEditPostsTableViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import UIKit

class ViewPostsTableViewController: UITableViewController, CreatePostViewControllerDelegate, PostsTableViewCellDelegate {
    
    func postEdited(_ post: Post) {
        Task {
            await gettingPostInformation()
        }
    }
    
    func postCreated(_ post: Post) {
        Task {
            await gettingPostInformation()
        }
    }
    
    func postsTableViewCell(_ controller: PostsTableViewCell) {
        Task {
            controller.post.postid
            await deletingPosts(postid: controller.post.postid)
        }
    }
    
    
    
//    func postsTableViewCell(_ Controller: PostsTableViewCell, didSelect post: Post) {
//        self.posts = post
//        updateCellInformation()
//    }
    
    
    var posts = [Post] ()
    var postInformationAPI = PostInformation()
    var currentUser = User.current
    var comments = CommentInformation()
    var delete = DeleteEditPosts()
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        Task
//        {
//           await gettingPostInformation()
//            await gettingLikesInformation()
//            tableView.reloadData()
//        }
//
//
//    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Task
        {
           await gettingPostInformation()

            DispatchQueue.main.async {
                self.tableView.reloadData()
                //
            }
            
        }
        
        
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostsTableViewCell
               
        
        cell.post = posts[indexPath.row]
        cell.updateCellInformation()
 
        return cell
    }
    
    
    @IBSegueAction func fromCreatePostToTableView(_ coder: NSCoder) -> CreatePostViewController? {
        var vc = CreatePostViewController(coder: coder)
        vc?.delegate = self
        return vc!
    }
    
    
    @IBSegueAction func fromEditCreatePostToTableView(_ coder: NSCoder) -> CreatePostViewController? {
        var vc = CreatePostViewController(coder: coder)
        vc?.delegate = self
        return vc!
    }
    


    func gettingPostInformation() async {
        do {
            posts = try await postInformationAPI.userGetPostingInformation(pageNumber: 0, userSecret: currentUser!.secret)
            
        }
        catch {
            print (error.localizedDescription)
        }
        

    }
   

    func deletingPosts(postid: Int) async {
        do {

            try await delete.userDeletePost(postid: postid, userSecret: currentUser!.secret)
        }
        catch {
            print (error)
        }
    }
}





