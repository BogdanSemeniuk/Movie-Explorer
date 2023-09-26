//
//  SignUpViewModel.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import Foundation
import Combine

protocol SignUpAbstraction: ObservableObject {
    var email: String { get set }
    var password: String { get set }
    var confirmedPassword: String { get set }
    var userName: String { get set }
    var isLoading: Bool { get }
    func signUp()
    func fieldsNotFilled() -> Bool
}

final class SignUpViewModel: SignUpAbstraction {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmedPassword = ""
    @Published var isLoading = false
    @Published private var token = ""
    private let request = Just("sfa56as5gsd56g6rfdgsfvbn")
    
    func fieldsNotFilled() -> Bool {
        return email.isEmpty || email.isEmpty || password.isEmpty || confirmedPassword.isEmpty
    }
    
    func signUp() {
        do {
            try propertiesValidation()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func propertiesValidation() throws  {
        guard password.count >= 6 else { throw InputError.shortPassword }
        guard password == confirmedPassword else { throw InputError.passwordsDontMatch  }
        guard password.first(where: { $0.isNumber }) != nil else { throw InputError.digitlessPassword }
        guard email.hasPrefix("www.") else { throw InputError.emailPrefix }
        guard email.contains("@") else { throw InputError.emailAt }
        guard (1...3).contains(email.components(separatedBy: ".").last?.count ?? 0) else { throw InputError.emailSuffix }
    }
}

extension SignUpViewModel {
    enum InputError: LocalizedError {
        case shortPassword, passwordsDontMatch, digitlessPassword, emailPrefix, emailSuffix, emailAt
        
        var errorDescription: String? {
            switch self {
            case .shortPassword: return "Password is too short. It must contain at least 6 characters"
            case .passwordsDontMatch: return "The password and the confirmed password do not match"
            case .digitlessPassword: return "Password must contain at least 1 digit"
            case .emailPrefix: return "Email must start with www."
            case .emailSuffix: return "Email must have suffix .ua, .com, etc"
            case .emailAt: return "Email must contain @"
            }
        }
    }
}
