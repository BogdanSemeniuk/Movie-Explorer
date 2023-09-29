//
//  SignUpFactory.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 29.09.2023.
//

import SwiftUI

struct SignUpFactory {
    static func make() -> some View {
        return SignUpView(viewModel: SignUpViewModel())
    }
}
