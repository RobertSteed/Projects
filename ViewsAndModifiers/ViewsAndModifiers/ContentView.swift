//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Robert Steed on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    
    
    //TODO have a reference / instance of GameState here
    
    @State private var game = GameState()
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        VStack {
            Text("Players Score")
            Text("\(game.playersScore)")
                .padding()
            Text("Computers next move")
                .padding()
            Text(game.rockPaperScissors[game.appsChoiceOfRPS])
                .font(.largeTitle.bold())
                .padding()
    
            Text("You must \(game.currentPosition())")
                .padding()
            
            
            Button("Rock") {
                game.checkVictory(selection: "Rock")
                self.showingScore = true
            }
            .alert(game.scoreTitle, isPresented: $showingScore) {
                    Button("Continue") {
                        game.nextRound()
                        self.showingScore = false
                    }
                } message: {
                    Text("Your score is \(game.playersScore)")
                }
            Spacer()
            
            Button("Paper") {
                game.checkVictory(selection: "Paper")
                self.showingScore = true
            }
            .alert(game.scoreTitle, isPresented: $showingScore) {
                Button("Continue") {
                    game.nextRound()
                    self.showingScore = false
                }
            } message: {
                Text("Your score is \(game.playersScore)")
            }
            Spacer()
            
            Button("Scissors") {
                game.checkVictory(selection: "Scissors")
                self.showingScore = true
            }
            .padding()
            .alert(game.scoreTitle, isPresented: $showingScore) {
                    Button("Continue") {
                        game.nextRound()
                        self.showingScore = false
                    }
                } message: {
                    Text("Your score is \(game.playersScore)")
                }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}

//use .toggle between rounds so that the app can switch between winning and losing
