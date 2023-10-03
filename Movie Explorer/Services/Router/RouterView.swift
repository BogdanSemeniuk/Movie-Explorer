//
//  RouterView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 03.10.2023.
//

import SwiftUI

struct RouterView: View {
    @ObservedObject private var router = Router.shared
    
    var body: some View {
        NavigationStack(path: $router.path) {
            SignInFactory.make()
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .signIn:
                        SignInFactory.make()
                    case .signUp:
                        SignUpFactory.make()
                    }
                }
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
