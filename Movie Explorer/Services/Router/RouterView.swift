//
//  RouterView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 03.10.2023.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject private var dependencyContainer = DependencyContainer.shared
    @ObservedObject private var router = DependencyContainer.shared.router
    @ObservedObject private var authService = DependencyContainer.shared.authService
    
    var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .signIn:
                        dependencyContainer.signInModule
                    case .signUp:
                        dependencyContainer.signUpModule
                    }
                }
        }
    }
    
    @ViewBuilder private var rootView: some View {
        if authService.isLogined {
            dependencyContainer.exploreModule
        } else {
            dependencyContainer.signInModule
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
