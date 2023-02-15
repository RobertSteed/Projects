import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [] {
        didSet {
            Emoji.saveToFile(arr: emojis)
        }
    }
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        guard let emojisFromDisk = Emoji.loadFromFile() else {return}
        emojis = emojisFromDisk
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            // Editing Emoji
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else {
            // Adding Emoji
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
            let sourceViewController = segue.source as? AddEditEmojiTableViewController,
            let emoji = sourceViewController.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Step 1: Dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell

        //Step 2: Fetch model object to display
        let emoji = emojis[indexPath.row]

        //Step 3: Configure cell
        cell.update(with: emoji)
        cell.showsReorderControl = true

        //Step 4: Return cell
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    

}

//class ViewPostsTableViewController: UITableViewController, CreatePostViewControllerDelegate, PostsTableViewCellDelegate {
//
//    func postEdited(_ post: Post) {
//        Task {
//            await gettingPostInformation()
//        }
//    }
//
//    func postCreated(_ post: Post) {
//        Task {
//            await gettingPostInformation()
//        }
//    }
//
//    func postsTableViewCell(_ controller: PostsTableViewCell) {
//        Task {
//            await deletingPosts(postid: controller.post.postid)
//            deletePost(at: tableView.indexPath(for: controller)!)
//        }
//    }
//
//
//
//    //    func postsTableViewCell(_ Controller: PostsTableViewCell, didSelect post: Post) {
//    //        self.posts = post
//    //        updateCellInformation()
//    //    }
//
//
//    var posts = [Post] ()
//    var postInformationAPI = PostInformation()
//    var currentUser = User.current
//    var comments = CommentInformation()
//    var delete = DeleteEditPosts()
//
//    override func viewDidLoad() {
//
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension
//    }
//
//
//    //    override func viewDidLoad() {
//    //        super.viewDidLoad()
//    //
//    //        Task
//    //        {
//    //           await gettingPostInformation()
//    //            await gettingLikesInformation()
//    //            tableView.reloadData()
//    //        }
//    //
//    //
//    //    }
//    //
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        Task
//        {
//            await gettingPostInformation()
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        }
//
//
//    }
//
//
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        // #warning Incomplete implementation, return the number of rows
//        return posts.count
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostsTableViewCell
//
//
//        cell.post = posts[indexPath.row]
//        cell.delegate = self
//
//        //        let post = posts[indexPath.row]
//        //        cell.posts = post
//        //        cell.didTapDelete = {
//        ////            DeleteEditPosts().userDeletePost(postid: post.postid, userSecret: currentUser!.secret)
//        //            // update your tableView's data (`posts`)
//        //            // update the tableView UI
//        //        }
//
//        cell.updateCellInformation()
//
//
//
//        return cell
//
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//
//
//    @IBSegueAction func fromCreatePostToTableView(_ coder: NSCoder) -> CreatePostViewController? {
//        var vc = CreatePostViewController(coder: coder)
//        vc?.delegate = self
//        return vc!
//    }
//
//
//    @IBSegueAction func fromEditCreatePostToTableView(_ coder: NSCoder, sender: Any?) -> CreatePostViewController? {
//        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
//            let postToEdit = posts[indexPath.row]
//            return CreatePostViewController(coder: coder, post: nil)
//
//        } else {
//            return CreatePostViewController(coder: coder, post: nil)
//        }
//
//    }
//
//        func gettingPostInformation() async {
//            do {
//                posts = try await postInformationAPI.userGetPostingInformation(pageNumber: 0, userSecret: currentUser!.secret)
//
//            }
//            catch {
//                print (error.localizedDescription)
//            }
//
//
//        }
//
//        func deletePost(at indexPath: IndexPath) {
//            posts.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//
//
//        func deletingPosts(postid: Int) async {
//            do {
//
//                try await delete.userDeletePost(postid: postid, userSecret: currentUser!.secret)
//            }
//            catch {
//                print (error)
//            }
//        }
//
//        //
//
//    }
//

