//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Robert Steed on 10/25/22.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func shareButton(_ sender: UIButton) {
        
        guard let image = imageView.image else {return}
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        present(activityController, animated: true)
    }
    
    @IBAction func safariButton(_ sender: UIButton) {
        
        guard let url = URL(string: "https://www.apple.com") else {return}
        
        let safariController = SFSafariViewController(url: url)
        present(safariController, animated: true)
    }
    
    @IBAction func cameraButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            print("camera Button Tapped")
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true)
                }
            
        alertController.addAction(cameraAction)
        present(alertController, animated: true)
        }
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
            print("Photo Library Button tapped")
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
                }
            alertController.addAction(photoLibraryAction)
            }
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true)
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {return}
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["noblesteed52@gmail.com"])
        mailComposer.setSubject("Check this out")
        mailComposer.setMessageBody("This is awesome", isHTML: false)
        
        if let image = imageView.image, let jpegData = image.jpegData(compressionQuality: 0.9)  {
            mailComposer.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "photo.jpeg")
        }
        
        present(mailComposer, animated: true)
        
        
    }
    

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        
        imageView.image = selectedImage
        dismiss(animated: true)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
    
    
}

