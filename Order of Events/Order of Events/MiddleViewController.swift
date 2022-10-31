//
//  MiddleViewController.swift
//  Order of Events
//
//  Created by Robert Steed on 9/30/22.
//

import UIKit

class MiddleViewController: UIViewController {
    
    
    @IBOutlet weak var middleLabel: UILabel!
    
    var eventNumber: Int = 1
    
    func addEvent(from: String) {
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent Number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//       addEvent(from: "viewWillLoad")
//        addEvent(from: "viewDidLoad")
//        addEvent(from: "viewWillDisappear")
//        addEvent(from: "viewDidDisappear")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addEvent(from: "viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        addEvent(from: "viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        addEvent(from: "viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        addEvent(from: "viewDidDisappear")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
