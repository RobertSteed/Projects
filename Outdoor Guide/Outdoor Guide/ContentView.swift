//
//  ContentView.swift
//  Outdoor Guide
//
//  Created by Robert Steed on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.55, blue: 0.13)
                VStack {
                   Button("Hunting", action: sendToHuntingPage)
                        .font(
                            .largeTitle
                                .weight(.bold))
                    Button("Fishing", action: sendToFishingPage)
                        .font(
                            .largeTitle
                                .weight(.bold))
                } 
                
            } .navigationTitle("How To Do It")
            .foregroundColor(.white)
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
func sendToHuntingPage() {
    
}
func sendToFishingPage() {
    
}
