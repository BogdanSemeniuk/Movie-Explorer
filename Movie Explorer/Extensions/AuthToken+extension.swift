//
//  AuthToken+extension.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 06.10.2023.
//

import Foundation

extension AuthToken {
    convenience init(value: String) {
        self.init(entity: AuthToken.entity(), insertInto: PersistenceController.shared.context)
        self.value = value
    }
}
