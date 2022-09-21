//
//  UserControllerApp.swift
//  UserController
//
//  Created by user226741 on 9/19/22.
//

import SwiftUI

@main
struct UserControllerApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
