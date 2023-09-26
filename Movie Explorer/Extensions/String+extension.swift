//
//  String+extension.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import Foundation

extension String {
    func localized() -> String {
        return String(localized: LocalizedStringResource(stringLiteral: self))
    }
}
