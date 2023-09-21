//
//  SignInViewModel.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 19.09.2023.
//

import SwiftUI

protocol SignInAbstraction: ObservableObject {
    func signIn()
}

final class SignInViewModel: SignInAbstraction {
    func signIn() {
    }
}
