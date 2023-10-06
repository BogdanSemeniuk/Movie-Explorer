//
//  User+Extension.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 05.10.2023.
//

import CoreData

extension User {
    convenience init(_ name: String, _ email: String, _ password: String) {
        self.init(entity: User.entity(), insertInto: PersistenceController.shared.context)
        self.name = name
        self.password = password
        self.email = email
    }
}
