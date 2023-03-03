//
//  UserProfileViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/15/23.
//

import UIKit

class UserProfileViewController: UIViewController, EditUserInformationViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {
 
    
    
        func editUserInformationViewController(_ Controller: EditUserInformationViewController, didSelect user: User) {
            self.currentUser = user
            updateInformation()
        }
    
    
        var currentUser = User.current
    
        var userPosts: [Post] = []
        let gettingPosts = PostInformation()
        var userInformation = UserInfomationClass()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var techInterestsLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            postsTableView.delegate = self
            postsTableView.dataSource = self
            Task {
               await gettingUserInformation()
               
            }
            
    
        }
    
        override func viewWillAppear(_ animated: Bool) {
    
            Task {
                await gettingUserPostingInformation()
                postsTableView.reloadData()
            }
            super.viewWillAppear(animated)
    
        }
    
    
        func updateInformation() {
    //        currentUser = User.current
            usernameLabel.text = "Username: \(currentUser!.userName)"
            nameLabel.text = "Name: \(currentUser!.firstName)  \(currentUser!.lastName)"
            bioLabel.text = " Bio: \(currentUser!.bio)"
            techInterestsLabel.text = "Tech Interests: \(currentUser!.techInterests)"
    
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userPosts.count
        } else {
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPosts", for: indexPath) as! UserPostsTableViewCell
        
        let post = userPosts[indexPath.row]
        cell.update(with: post)
        
        
        return cell
    }
    
    
    
    
    
        func gettingUserPostingInformation() async {
            do {
               userPosts = try await gettingPosts.userGetPostingForUser(pageNumber: 0, userSecret: currentUser!.secret, userUUID: currentUser!.userUUID)
            }
            catch {
                print(error)
            }
        }
    
    
    
    
    
    }
    



