//
//  Initial Capital View.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/14/23.
//

import SwiftUI

struct Initial_Capital_View: View {
    
    @State var showDetail: Bool = false
    @State private var showingAlert = false
    @State private var opacity = 0.8
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("State Capitol")
                
                
                Button("Get Started!") {
                    showingAlert = true
                } .font(.title)
                    .padding()
                    .foregroundColor(.primary)
                    .background(.white)
                    .opacity(opacity)
                .alert("We would like access to your location", isPresented: $showingAlert) {
                    NavigationLink("Ok!", destination: TabBarView())
                }
                
            } .navigationTitle("Civil Servant")
                
            
        }
    }
}

struct Initial_Capital_View_Previews: PreviewProvider {
    static var previews: some View {
        Initial_Capital_View()
    }
}
