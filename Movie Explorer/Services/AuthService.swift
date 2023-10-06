//
//  AuthService.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 04.10.2023.
//

import SwiftUI
import Combine
import CoreData

protocol AuthManageable {
    func registerUser(with userName: String, _ email: String, _ password: String) throws
//    func save(token: String) -> AnyPublisher<String, Error>
//    func login(with credentials: Credentials) -> AnyPublisher<String, Error>
//    func logout()
    var isLogined: Bool { get }
}

final class AuthService: AuthManageable, ObservableObject {
    private let persistenceController: PersistenceController
    @Published var isLogined: Bool
    
    init(persistenceController: PersistenceController = .shared) {
        self.persistenceController = persistenceController
        self.isLogined = ((try? persistenceController.context.fetch(AuthToken.fetchRequest()).first) != nil)
    }
    
    func registerUser(with userName: String, _ email: String, _ password: String) throws {
        try validate(userName: userName, email)
        
        _ = User(userName, email, password)
        
        let newToken = generateToken()
        _ = AuthToken(value: newToken)
        persistenceController.save()
        isLogined = true
    }
    
    private func validate(userName: String, _ email: String) throws {
        let request = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@ OR name == %@", email, userName)
        if let users = try? persistenceController.context.fetch(request) {
            if let _ = users.first(where: { $0.email == email }) {
                throw AuthError.emailRegistered
            }
            if let _ = users.first(where: { $0.name == userName }) {
                throw AuthError.userNameRegistered
            }
        }
    }
    
    private func generateToken() -> String {
        return UUID().uuidString
    }
}

extension AuthService {
    enum AuthError: LocalizedError {
        case emailRegistered, userNameRegistered
        
        var errorDescription: String? {
            switch self {
            case .emailRegistered: return "That email address is already registered"
            case .userNameRegistered: return "A user with that name already exists"
            }
        }
    }
}
