//
//  ViewController.swift
//  AppEventCount
//
//  Created by Robert Steed on 10/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var applicationDidFinishLaunchingLabel: UILabel!
    @IBOutlet weak var applicationConfigurationForConnectingLabel: UILabel!
    @IBOutlet weak var sceneWillConnectToLabel: UILabel!
    @IBOutlet weak var sceneDidBecomeActiveLabel: UILabel!
    @IBOutlet weak var sceneWillResignActiveLabel: UILabel!
    @IBOutlet weak var sceneWillEnterForegroundLabel: UILabel!
    @IBOutlet weak var sceneDidEnterBackgroundLabel: UILabel!
    
    var willConnectCount = 0
    var sceneWillResignActiveCount = 0
    var sceneWillEnterForgroundCount = 0
    var sceneDidEnterBackgroundCount = 0
    var sceneDidBecomeActiveCount = 0
    var sceneDidEnterBackground = 0
    var sceneDidBecomeActive = 0
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    func updateView() {
        applicationDidFinishLaunchingLabel.text = "The App has launched \(appDelegate.launchCount) time(s)"
        applicationConfigurationForConnectingLabel.text = "The App configured \(appDelegate.configurationForConnectingCount) time(s)"
        sceneWillConnectToLabel.text = "The app will connect to label \(willConnectCount) time(s)"
        sceneDidBecomeActiveLabel.text = "The app did become active \(sceneDidBecomeActiveCount) time(s)"
        sceneWillResignActiveLabel.text = "The app resigned active \(sceneWillResignActiveCount) time(s)"
        sceneWillEnterForegroundLabel.text = "The app will enter the foreground \(sceneWillEnterForgroundCount) time(s)"
        sceneDidEnterBackgroundLabel.text = "The app did enter the background \(sceneDidEnterBackgroundCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

