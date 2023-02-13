//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Steed on 1/10/23.
//

import SwiftUI
struct ContentView: View {
    
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()

   @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreNumber = 0
    
    var counting: Int {
       var updatingScore = 0
        updatingScore = scoreNumber
        if scoreTitle == "Correct" {
            updatingScore += 1
        } else if scoreTitle == "Wrong" {
            updatingScore += 0
        }
        return updatingScore
    }
    
    var body: some View {
        ZStack {
           RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the Flag Of")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
            }
    }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .backgroundStyle(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score \(counting)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
        }
            .padding()
}
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(counting)")
        }
    }



    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
