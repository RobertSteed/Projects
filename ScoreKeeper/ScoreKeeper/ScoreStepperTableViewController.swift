//
//  ScoreStepperTableViewController.swift
//  ScoreKeeper
//
//  Created by Robert Steed on 11/16/22.
//

import UIKit

class ScoreStepperTableViewController: UITableViewController, PlayerCellDelegate {
    
    
    var players: [Player] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    
    @IBSegueAction func addPlayer(_ coder: NSCoder, sender: Any?) -> AddNewPlayersTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            
            let playerToEdit = players[indexPath.row]
            return AddNewPlayersTableViewController(coder: coder, player: playerToEdit)
        } else {
            return AddNewPlayersTableViewController(coder: coder, player: nil)
        }
    }
    
    
    
    
    @IBAction func unwindToScoreStepperTableViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? AddNewPlayersTableViewController,
              let player = sourceViewController.player else {return}
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            players[selectedIndexPath.row] = player
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: players.count, section: 0)
            players.append(player)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    // MARK: - Table view data source
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return players.count
        } else {
            return 0
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
        let player = players[indexPath.row]
        cell.delegate = self
        cell.update(with: player)
        cell.showsReorderControl = true
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedPlayer = players[fromIndexPath.row]
        players.remove(at: fromIndexPath.row)
        players.insert(movedPlayer, at: destinationIndexPath.row)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func scoreChanged(sender: PlayerTableViewCell, score: Int) {
        if let indexPath = tableView.indexPath(for: sender) {
            players[indexPath.row].score = score
            //        players[1].score = score
            players.sort(by: >)
            tableView.reloadData()
            
        }
    }
        // players.sorted(bY: $0.score > $1.score)
        // tableview.reload
        // do that within the function scoreChanged
        //update data, sort, reload tableView
        
        
        
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        
        // Override to support rearranging the table view
        
        
        
        // Override to support conditional rearranging of the table view.
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
        
        
        
        
        
        
        
        
        
        /* you aer using a delegate and a protocal from the stepper. You need a deleage for the table view cell to talk to tthe table view. The delegate will pass the changed player hack to the table view then your delegage needs to update the players array so the array will have the upadated score. Them resort and update the talbe view
         */
        
        
        
        
    }

