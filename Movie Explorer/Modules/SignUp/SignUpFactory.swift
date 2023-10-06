//
//  SignUpFactory.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 29.09.2023.
//

import SwiftUI

struct SignUpFactory {
    static func make() -> some View {
        let router = Router.shared
        let authService = AuthService()
        let viewModel = SignUpViewModel(router: router, authService: authService)
        return SignUpView(viewModel: viewModel)
    }
}
