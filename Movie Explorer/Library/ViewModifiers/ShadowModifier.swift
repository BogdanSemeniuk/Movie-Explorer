//
//  ShadowModifier.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 15.09.2023.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .darkShadow, radius: .shadowRadius, x: .shadowOffsetX, y: .shadowOffsetY)
            .shadow(color: .lightShadow, radius: .shadowRadius, x: -.shadowOffsetX, y: -.shadowOffsetY)
    }
}
