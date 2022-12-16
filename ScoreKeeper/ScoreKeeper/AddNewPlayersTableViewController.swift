//
//  AddNewPlayersTableViewController.swift
//  ScoreKeeper
//
//  Created by Robert Steed on 11/16/22.
//

import UIKit

class AddNewPlayersTableViewController: UITableViewController {
    
    var player: Player?
    
    
    @IBOutlet weak var newScoreTextField: UITextField!
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let player = player {
            newNameTextField.text = player.name
            newScoreTextField.text = String(player.score)
            title = "Add New Player"
        }
        
        updateSaveButtonState()

    }
    
    init?(coder: NSCoder, player: Player?) {
        self.player = player
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSaveButtonState() {
        let nameText = newNameTextField.text ?? ""
        let scoreText = newScoreTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty && !scoreText.isEmpty
    }
    
    
    @IBAction func textEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else {return}
        
        let name = newNameTextField.text ?? ""
        let score = newScoreTextField.text ?? ""
        if let score = Int(score) {
            player = Player(name: name, score: score)
        }
    }
    
    
    

    // MARK: - Table view data source



    

}
