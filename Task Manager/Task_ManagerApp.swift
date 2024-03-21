//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by 안녕하세요 on 12/2/23.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
