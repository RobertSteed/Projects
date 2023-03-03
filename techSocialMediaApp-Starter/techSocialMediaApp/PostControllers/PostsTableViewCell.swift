//
//  PostsTableViewCell.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/8/23.
//

import UIKit

protocol PostsTableViewCellDelegate: AnyObject {
    func postsTableViewCell(_ Controller: PostsTableViewCell)
    func editPosts(_ Controller: PostsTableViewCell)
}


class PostsTableViewCell: UITableViewCell {
    
    
    weak var delegate: PostsTableViewCellDelegate?
    
    var post = Post(postid: 0, title: "", body: "", authorUserName: "", authorUserId: "", likes: 0, userLiked: true, numComments: 0, createdDate: "")
    
    var comment = Comments(commentId: 0, body: "", userName: "", userId: "", createdDate: Date.now)
    
//    var didTapDelete: (() -> Void)?
    
    var user = User.current
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var numberOfComments: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
//        if likeButton.isEnabled {
//            posts.likes += 1
//        }
    }
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        delegate?.editPosts(self)
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
            delegate?.postsTableViewCell(self)
        }
        
    
    func updateCellInformation() {
        
        let today = post.createdDate
        
        usernameLabel?.text = post.authorUserName
        
        postDateLabel?.text = today
        
        bodyLabel?.text = post.body
        
        numberOfComments?.text = String(post.numComments)
        
        numberOfLikesLabel?.text = String(post.likes)
        
        
        commentLabel?.text = comment.body
        
        titleLabel?.text = post.title
        
    }
    
}



/// Delete function not working
/// Like function is not allowing me to update the amount of likes (race condition?)
/// Edit button needs fixed
