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
    var error: SignUpViewModel.InputError? { get set }
    var isPresentedError: Bool { get set }
    func signUp()
    func fieldsNotFilled() -> Bool
}

final class SignUpViewModel: SignUpAbstraction {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmedPassword = ""
    @Published var isLoading = false
    @Published var error: InputError?
    @Published var isPresentedError = false
    
    init() {
        $error.map { $0 != nil }.assign(to: &$isPresentedError)
    }
    
    func fieldsNotFilled() -> Bool {
        return email.isEmpty || email.isEmpty || password.isEmpty || confirmedPassword.isEmpty
    }
    
    func signUp() {
        do {
            try propertiesValidation()
        } catch {
            self.error = InputError(error)
        }
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
    enum InputError: LocalizedError, CaseIterable {
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
        
        init?(_ error: Error) {
            guard let inputError = InputError.allCases
                .first(where: { $0.localizedDescription == error.localizedDescription }) else { return nil }
            self = inputError
        }
    }
}
