//
//  Movie_ExplorerApp.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

@main
struct Movie_ExplorerApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RouterView()
        }.onChange(of: scenePhase) { _ in
            PersistenceController.shared.save()
        }
    }
}
