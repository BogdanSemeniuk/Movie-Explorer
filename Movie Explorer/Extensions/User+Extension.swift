//
//  User+Extension.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 05.10.2023.
//

import Foundation

extension User {
    convenience init(_ name: String, _ email: String, _ password: String) {
        self.init()
        self.name = name
        self.password = password
        self.email = email
    }
}
