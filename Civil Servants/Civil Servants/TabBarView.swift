//
//  TabBarView.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/20/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ListOfOffices()
                 .tabItem {
                   Label("Officials", systemImage: "checkerboard.shield")
                 }
               CalendarView()
                 .tabItem{
                   Label("Meeting Times", systemImage: "calendar")
                 }
             }
           }
         }

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
