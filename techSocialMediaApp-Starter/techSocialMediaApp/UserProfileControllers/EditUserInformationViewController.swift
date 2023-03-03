//
//  EditUserInformationViewController.swift
//  techSocialMediaApp
//
//  Created by Robert Steed on 2/6/23.
//

import UIKit

protocol EditUserInformationViewControllerDelegate: AnyObject {
    func editUserInformationViewController(_ Controller: EditUserInformationViewController, didSelect user: User)
}


class EditUserInformationViewController: UIViewController {
    
    var currentUser = User.current
    let userProfileInformation = UserProfileViewController()
    let userAPIRequestChange = UserInfomationClass()
    weak var delegate: EditUserInformationViewControllerDelegate?
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var techInterestsTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let userName = userNameTextField.text ?? ""
        let bio = bioTextField.text ?? ""
        let techInterests = techInterestsTextField.text ?? ""
        Task {
            try! await userAPIRequestChange.userPostInformation(userName: userName, bio: bio, techInterests: techInterests)
        }
        currentUser?.techInterests = techInterests
        currentUser?.bio = bio
        currentUser?.userName = userName
        if let user = currentUser {
            delegate?.editUserInformationViewController(self, didSelect: user)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
