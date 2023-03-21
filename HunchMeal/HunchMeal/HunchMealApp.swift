//
//  HunchMealApp.swift
//  HunchMeal
//
//  Created by Leonardo Wijaya on 21/03/23.
//

import SwiftUI

@main
struct HunchMealApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
