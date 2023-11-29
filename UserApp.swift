//
//  UserApp.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

@main
struct UserApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
