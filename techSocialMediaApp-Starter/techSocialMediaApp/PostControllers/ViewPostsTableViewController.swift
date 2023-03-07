//
//  AddEditPostsTableViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import UIKit

class ViewPostsTableViewController: UITableViewController, CreatePostViewControllerDelegate, PostsTableViewCellDelegate {
    
    
    func editPosts(_ Controller: PostsTableViewCell) {
        performSegue(withIdentifier: "editPosts", sender: Controller)
    }
    
    

    var posts = [Post] ()
    var postInformationAPI = PostInformation()
    var currentUser = User.current
    var comments = CommentInformation()
    var delete = DeleteEditPosts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    
    
    
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
        cell.delegate = self
        
        //      
        cell.updateCellInformation()
        return cell
    }
    
    
    
    
    @IBSegueAction func createNewPost(_ coder: NSCoder) -> CreatePostViewController? {
        var vc = CreatePostViewController(coder: coder, post: nil)
        vc?.delegate = self
        return vc!
    }
    
    
    
    
    
    @IBSegueAction func editPostsSegue(_ coder: NSCoder, sender: Any?) -> CreatePostViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            
            let postToEdit = posts[indexPath.row]
            var vc = CreatePostViewController(coder: coder, post: postToEdit)
            vc?.delegate = self
            return vc   
            
        } else {
            return CreatePostViewController(coder: coder, post: nil)
        }
    }
    
    
    
    func postEdited(_ editedPost: Post) {

        for (index, post) in posts.enumerated() {
            if editedPost.postid == post.postid {
                posts[index] = editedPost
                tableView.reloadData()
            }
           
        }
        
//        Task {
//            await gettingPostInformation()
//        }
    }
    
    
    
    func postCreated(_ post: Post) {
        Task {
            await gettingPostInformation()
        }
    }
    
    
    
        func gettingPostInformation() async {
            do {
                posts = try await postInformationAPI.userGetPostingInformation(pageNumber: 0, userSecret: currentUser!.secret)
                
            }
            catch {
                print (error.localizedDescription)
            }
        }
    
    
    
    func postsTableViewCell(_ controller: PostsTableViewCell) {
        Task {
            await deletingPosts(postid: controller.post.postid)
            deletePost(at: tableView.indexPath(for: controller)!)
        }
    }
    
    
    
        
        func deletePost(at indexPath: IndexPath) {
            posts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    
    
        
        
        func deletingPosts(postid: Int) async {
            do {
                
                try await delete.userDeletePost(postid: postid, userSecret: currentUser!.secret)
            }
            catch {
                print (error)
            }
        }
        
        //
        
    }






