//
//  UserControllerApp.swift
//  UserController
//
//  Created by user226741 on 9/19/22.
//

import SwiftUI

@main
struct UserControllerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
