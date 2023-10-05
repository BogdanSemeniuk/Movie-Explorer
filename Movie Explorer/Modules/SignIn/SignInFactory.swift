//
//  SignInFactory.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 29.09.2023.
//

import SwiftUI

struct SignInFactory {
    static func make() -> some View {
        let router = Router.shared
        return SignInView(viewModel: SignInViewModel(router: router))
    }
}