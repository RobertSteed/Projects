//
//  PlayerTableViewCell.swift
//  ScoreKeeper
//
//  Created by Robert Steed on 11/16/22.
//

import UIKit

protocol PlayerCellDelegate: AnyObject {
    func scoreChanged(sender: PlayerTableViewCell, score: Int)
    
}

class PlayerTableViewCell: UITableViewCell {
    
    weak var delegate: PlayerCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreStepper: UIStepper!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func update(with player: Player) {
        scoreStepper.value = Double(player.score)
        nameLabel.text = player.name
        scoreLabel.text = String(describing: player.score)
    }
    
    func updateScore() {
        scoreLabel.text = "\(Int(scoreStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateScore()
        let score = Int(scoreStepper.value)
        scoreLabel.text = "\(score)"
        delegate?.scoreChanged(sender: self, score: score)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
