//
//  UserProfileTableViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/1/23.
//

import UIKit

class UserProfileTableViewController: UITableViewController, EditUserInformationViewControllerDelegate {
    
    func editUserInformationViewController(_ Controller: EditUserInformationViewController, didSelect user: User) {
        self.currentUser = user
        updateInformation()
    }
    
    
    var currentUser = User.current
    
    var userPosts = UserPosts(postid: 0, title: "", body: "", authorUserName: "", authorUserId: "", likes: 0, userLiked: true, numComments: 0, createdDate: "")
    
    let gettingPosts = PostInformation()
    var userInformation = UserInfomationClass()
    
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileFirstNameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var techInterestsLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    @IBOutlet weak var profileLastNameLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
           await gettingUserInformation()
            tableView.reloadData()
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        Task {
//            await gettingUserPosts()
//        }
        super.viewWillAppear(animated)
        
    }
    
    
    func updateInformation() {
//        currentUser = User.current
        userNameLabel.text = currentUser?.userName
        profileFirstNameLabel.text = currentUser?.firstName
        profileLastNameLabel.text = currentUser?.lastName
        bioLabel.text = currentUser?.bio
        techInterestsLabel.text = currentUser?.techInterests
        postsLabel.text = userPosts.body
        
    }
    

    @IBSegueAction func fromUserProfileToEditProfile(_ coder: NSCoder) -> EditUserInformationViewController? {
        var vc = EditUserInformationViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
    
    func gettingUserInformation() async {
        do {
            try await currentUser = userInformation.userGetInformation(userUUID: User.current!.userUUID, userSecret: User.current!.secret)
            updateInformation()
        }
        catch {
            print (error.localizedDescription)
        }
        
    }
    
//    func gettingUserPostingInformation() async {
//        do {
//            try await userPosts = gettingPosts.userGetPostingForUser(pageNumber: 0, userSecret: currentUser!.secret, userUUID: currentUser!.userUUID)
//        }
//    }
//    

    
 
    
}
