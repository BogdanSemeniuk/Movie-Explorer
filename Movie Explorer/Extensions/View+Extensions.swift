//
//  View+Extensions.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

extension View {
    func padding(_ horizontal: CGFloat, _ vertical: CGFloat) -> some View {
        self
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
}
