//
//  Spinner.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 22.09.2023.
//

import SwiftUI

private struct SpinnerModifier: ViewModifier {
    private var isPresented: Bool
    private let size: CGSize
    private var spinnerView: () -> AnyView
    
    init(isPresented: Bool,
         size: CGSize,
         spinnerView: @escaping () -> AnyView) {
        self.isPresented = isPresented
        self.size = size
        self.spinnerView = spinnerView
    }
    
    func body(content: Content) -> some View {
        return content
            .overlay {
                if isPresented {
                    spinnerView()
                        .frame(width: size.width, height:  size.height)
                }
            }
    }
}

extension View {
    func spinner(isPresented: Bool,
                 size: CGSize = CGSize(width: .spinnerSideLength, height: .spinnerSideLength),
                 spinnerView: @escaping () -> AnyView) -> some View{
        modifier(SpinnerModifier(isPresented: isPresented,
                         size: size,
                         spinnerView: spinnerView))
    }
}
