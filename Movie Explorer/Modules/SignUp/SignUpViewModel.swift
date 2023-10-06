//
//  SignUpViewModel.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import Foundation
import Combine
import SwiftUI

protocol SignUpAbstraction: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var confirmedPassword: String { get set }
    var userName: String { get set }
    var isLoading: Bool { get }
    var errorDescription: String? { get }
    var isPresentedError: Bool { get set }
    func registerAccount()
    func fieldsNotFilled() -> Bool
    func toSignIn()
}

final class SignUpViewModel: SignUpAbstraction {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmedPassword = ""
    @Published var isLoading = false
    @Published var errorDescription: String?
    @Published var isPresentedError = false
    
    private let router: Routable
    private let authService: AuthManageable
    
    init(router: Routable, authService: AuthManageable) {
        self.router = router
        self.authService = authService
        
        $errorDescription.filter { $0 != nil }.map { _ in true }.assign(to: &$isPresentedError)
        $isPresentedError.filter { !$0 }.map { _ in nil  }.assign(to: &$errorDescription)
    }
    
    func fieldsNotFilled() -> Bool {
        return email.isEmpty || email.isEmpty || password.isEmpty || confirmedPassword.isEmpty
    }
    
    func registerAccount() {
        do {
            try propertiesValidation()
            try saveUser()
        } catch {
            self.errorDescription = error.localizedDescription
        }
    }
    
    func toSignIn() {
        router.signIn()
    }
    
    private func saveUser() throws {
        try authService.registerUser(with: userName, email, password)
    }
    
    private func propertiesValidation() throws  {
        guard password.count >= 6 else { throw InputError.shortPassword }
        guard password == confirmedPassword else { throw InputError.passwordsDontMatch  }
        guard password.first(where: { $0.isNumber }) != nil else { throw InputError.digitlessPassword }
        guard email.contains("@") else { throw InputError.emailAt }
        guard (1...3).contains(email.components(separatedBy: ".").last?.count ?? 0) else { throw InputError.emailSuffix }
    }
}


extension SignUpViewModel {
    enum InputError: LocalizedError {
        case shortPassword, passwordsDontMatch, digitlessPassword, emailSuffix, emailAt
        
        var errorDescription: String? {
            switch self {
            case .shortPassword: return "Password is too short. It must contain at least 6 characters"
            case .passwordsDontMatch: return "The password and the confirmed password do not match"
            case .digitlessPassword: return "Password must contain at least 1 digit"
            case .emailSuffix: return "Email must have suffix .ua, .com, etc"
            case .emailAt: return "Email must contain @"
            }
        }
    }
}
