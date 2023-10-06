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
    
    private init() {}
}

extension Router: Routable {
    func signIn() {
        path.removeLast()
    }
    
    func signUp() {
        path.append(.signUp)
    }

}
