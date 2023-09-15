//
//  ActionButtonStyle.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 15.09.2023.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: .largeButtonWidth, height: .largeButtonHeight)
            .background(configuration.isPressed ? Color.buttonBackgroundPressed : .buttonBackground)
            .foregroundColor(configuration.isPressed ? .buttonTextPressed : .buttonText)
            .font(.title2)
            .fontWeight(.bold)
            .cornerRadius(.cornerRadius)
            .modifier(ShadowModifier())
    }
}
