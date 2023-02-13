//
//  Gameplay.swift
//  MultiplicationTableGame
//
//  Created by Robert Steed on 1/18/23.
//

import Foundation
class Gameplay: ObservableObject {
    var answer = ""
    @Published var firstNumber = 1
    @Published var secondNumber = 1
    @Published var countingCorrectAnswers = 0
    @Published var currentlySelected = 5
    let numberOfQuestions = [5, 10, 20]
    @Published var numberToBeMultiplied = 1
    
    func startGame() {
        nextRound()
    }
    func checkAnswer() {
        let isCorrect = firstNumber * secondNumber == Int(answer)
        if isCorrect {
            countingCorrectAnswers += 1
            firstNumber = Int.random(in: 1...12)
            secondNumber = numberToBeMultiplied
        }
        if countingCorrectAnswers == currentlySelected {
            nextRound()
            
        }
    }
    
    func nextRound() {
        firstNumber = Int.random(in: 1...12)
        secondNumber = numberToBeMultiplied
        countingCorrectAnswers = 0
    }
        
    
}

// make a counter
// set and alert so that once the counter reaches currentlyselected then it resets the game to 0
// set first number and second number to the number selected by the user
//Game is over func needs to reset everything

