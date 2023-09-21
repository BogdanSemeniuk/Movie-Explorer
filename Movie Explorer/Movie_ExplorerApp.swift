//
//  Movie_ExplorerApp.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

@main
struct Movie_ExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView(viewModel: SignInViewModel())
        }
    }
}
