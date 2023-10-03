//
//  Router.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 03.10.2023.
//

import SwiftUI

protocol Routable {
    func signIn()
    func signUp()
}

final class Router: ObservableObject {
    enum Destination {
        case signIn, signUp
    }
    
    static let shared = Router()
    @Published var path = [Destination]()
    
    init() {}
}

extension Router: Routable {
    func signIn() {
        if path.isEmpty {
            path.append(.signIn)
        } else {
            path.removeLast()
        }
    }
    
    func signUp() {
        if path.isEmpty {
            path.append(.signUp)
        } else {
            path.removeLast()
        }
    }
}
