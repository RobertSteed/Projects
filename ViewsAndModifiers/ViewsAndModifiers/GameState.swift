//
//  GameState.swift
//  ViewsAndModifiers
//
//  Created by Robert Steed on 1/12/23.
//

import Foundation
struct GameState {
    var playersScore = 0
    let scoreTitle: String = ""
    let rockPaperScissors = ["Rock", "Paper", "Scissors"].shuffled()
    var appsChoiceOfRPS = Int.random(in: 0...2)
    private var appsChoiceStandardMode = Bool.random()
    private var whetherYouMustWinOrLose = ""
    
//    mutating func updateScore() -> Int {
//        if scoreTitle == "Correct" {
//            playersScore += 1
//        } else if scoreTitle == "Wrong" {
//            playersScore -= 1
//        }
//        return playersScore
//    }
    
    mutating func nextRound() {
        rockPaperScissors.shuffled()
        appsChoiceOfRPS = Int.random(in: 0...2)
        appsChoiceStandardMode.toggle()
    }
    
    mutating func changingWinningOrLosing() {
        if appsChoiceStandardMode == true {
            whetherYouMustWinOrLose = "You must Win!"
        } else {
            whetherYouMustWinOrLose = "You must lose"
        }
    }
    
    func currentPosition() -> String {
        if appsChoiceStandardMode == true {
            return "win!"
        }
        return "lose!"
    }
    
    mutating func checkVictory(selection: String) {
        let computerStringChoice = rockPaperScissors[appsChoiceOfRPS]
        
        if computerStringChoice == "Rock" {
            if appsChoiceStandardMode {
                handleVictory(selection == "Paper")
            } else {
                handleVictory(selection == "Scissors")
            }
        } else if computerStringChoice == "Paper" {
            if appsChoiceStandardMode {
                handleVictory(selection == "Scissors")
                } else {
                    handleVictory(selection == "Rock") }
        } else {
            if appsChoiceStandardMode {
                handleVictory(selection == "Rock")
            } else {
                handleVictory(selection == "Paper")
            }
        }
    }
    
    mutating func handleVictory(_ didUserWin: Bool) {
        //if they won
        if didUserWin == true {
            playersScore += 1
        } else {
            playersScore -= 1
        }
            // incrment count
        //if they lost
            // handle it
    }
    
}
