//
//  SignInViewModel.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 19.09.2023.
//

import SwiftUI
import Foundation
import Combine

protocol SignInAbstraction: ObservableObject {
    func signIn()
    var isLoading: Bool { get }
}

final class SignInViewModel: SignInAbstraction {
    @Published var isLoading = false
    @Published var token = ""
    private let request = Just("sfa56as5gsd56g6rfdgsfvbn")
    
    func signIn() {
        guard !isLoading else { return }
        isLoading.toggle()
        request.delay(for: .seconds(5), scheduler: RunLoop.main).assign(to: &$token)
        $token.dropFirst().map { _ in false }.assign(to: &$isLoading)
    }
}
