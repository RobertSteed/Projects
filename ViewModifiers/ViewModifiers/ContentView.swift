//
//  ContentView.swift
//  ViewModifiers
//
//  Created by Robert Steed on 1/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
