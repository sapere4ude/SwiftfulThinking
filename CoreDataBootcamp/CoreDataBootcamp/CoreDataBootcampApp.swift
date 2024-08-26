//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Kant on 8/26/24.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
