//
//  RoundedViewModifier.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

struct RoundedViewModifier: ViewModifier {
    private let cornerRadius: CGFloat
    private let strokeWidth: CGFloat
    private let strokeColor: Color
    
    init(cornerRadius: CGFloat = .cornerRadius, strokeWidth: CGFloat = .textFieldBorderWidth, strokeColor: Color = .main) {
        self.cornerRadius = cornerRadius
        self.strokeWidth = strokeWidth
        self.strokeColor = strokeColor
    }
    
    func body(content: Content) -> some View {
            content
                .cornerRadius(cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(strokeColor, lineWidth: strokeWidth))
    }
}
