//
//  InitialViewController.swift
//  RandomUser
//
//  Created by Robert Steed on 2/27/23.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, InputNameViewControllerDelegate {
  
    
    var names = [Name]()
    

    @IBOutlet weak var nameTableView: UITableView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var listOfCandidates: UILabel!
    @IBOutlet weak var declareWinner: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTableView.delegate = self
        nameTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameTableViewCell
        
        let name = names[indexPath.row]
        cell.update(with: name)
       
        
        return cell
    }

    @IBAction func declareWinnerButtonTapped(_ sender: Any) {
        winnerLabel.text = names.randomElement()?.name
    }
    
    func inputNameViewController(_ Controller: InputNameViewController, didSelect name: Name) {
        self.names.append(name)
        nameTableView.reloadData()
    }
    
    @IBSegueAction func fromInitialToInput(_ coder: NSCoder) -> InputNameViewController? {
        var vc = InputNameViewController(coder: coder)
        vc?.delegate = self
        return vc
    }
    
    

}
