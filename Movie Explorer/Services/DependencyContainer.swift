//
//  DependencyContainer.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 06.10.2023.
//

import SwiftUI

final class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()
    
    var router = Router.shared
    var authService = AuthService()

    
    private(set) lazy var signInModule = {
        let viewModel = SignInViewModel(router: router)
        return SignInView(viewModel: viewModel)
    }()
    private(set) lazy var signUpModule = {
        let viewModel = SignUpViewModel(router: router, authService: authService)
        return SignUpView(viewModel: viewModel)
    }()
    private(set) lazy var exploreModule = {
        return ExploreView()
    }()
    
    private init() {}
}
