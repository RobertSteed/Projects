//
//  CoreDataEventTimesApp.swift
//  CoreDataEventTimes
//
//  Created by Robert Steed on 12/9/22.
//

import SwiftUI

@main
struct CoreDataEventTimesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
