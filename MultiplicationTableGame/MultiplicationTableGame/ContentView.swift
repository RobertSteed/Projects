//
//  ContentView.swift
//  MultiplicationTableGame
//
//  Created by Robert Steed on 1/18/23.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject private var game = Gameplay()
    @State private var displayingQuestion = ""
    
    var body: some View {
        Form {
            VStack {
                Section {
                    Stepper("\(game.numberToBeMultiplied)", value: $game.numberToBeMultiplied, in: 0...12, step: 1)
                } header: {
                    Text("Select number to multiply")
                }
            }
            Section {
                Picker("Question Count", selection: $game.currentlySelected) {
                    ForEach(game.numberOfQuestions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                Button("Lets Go!") {
                    game.nextRound()
                }
            }
        header: {
                Text ("Select how many questions you want")
            }
            
            
            Section {
                TextField("Enter you answer here", text: $game.answer)
                Button("Submit") {
                    game.checkAnswer()
                }
            }
            
            Section {
                Text("\(game.firstNumber) X \(game.secondNumber)")
            }
            Section {
                Text("\(game.countingCorrectAnswers)")
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

//

