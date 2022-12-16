//
//  SportsballApp.swift
//  Sportsball
//
//  Created by Robert Steed on 12/13/22.
//

import SwiftUI

@main
struct SportsballApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
