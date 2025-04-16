//
//  Devote_SwiftUI_MasterClassApp.swift
//  Devote SwiftUI MasterClass
//
//  Created by Aran Fononi on 16/4/25.
//

import SwiftUI

@main
struct Devote_SwiftUI_MasterClassApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
