//
//  ActionButtonStyle.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 15.09.2023.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        let colors = colors(forState: (isEnabled, configuration.isPressed))
        configuration.label
            .frame(width: .largeButtonWidth, height: .largeButtonHeight)
            .background(colors.background)
            .foregroundColor(colors.text)
            .font(.title2)
            .fontWeight(.bold)
            .cornerRadius(.cornerRadius)
            .modifier(ShadowModifier())
    }
}

extension ActionButtonStyle {
    func colors(forState state: (isEnabled: Bool, isPressed: Bool)) -> (background: Color, text: Color) {
        guard state.isEnabled else { return (.buttonBackgroundDisabled, .buttonTextDisabled) }
        return state.isPressed ? (.buttonBackgroundPressed, .buttonTextPressed) : (.buttonBackground, .buttonText)
    }
}
