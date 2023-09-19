//
//  SecureInputView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 15.09.2023.
//

import SwiftUI

struct SecureInputView: View {
    var placeholder: String
    @Binding var inputValue: String
    
    private let eyeButtonHorizontalPudding: CGFloat = 10
    @State private var isSecured = true
    @State private var visibleInput: String = ""
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField(placeholder, text: $visibleInput)
                .onChange(of: visibleInput) { newValue in
                    guard isSecured else { inputValue = newValue; return }
                    if newValue.count >= inputValue.count {
                        let newItem = newValue.filter { $0 != Character("●") }
                        inputValue.append(newItem)
                    } else {
                        inputValue.removeLast()
                    }
                    visibleInput = String(newValue.map { _ in Character("●") })
                }
            Button {
                isSecured.toggle()
                visibleInput = isSecured ? String(inputValue.map { _ in Character("●") }) :  inputValue
            } label: {
                Image(systemName: isSecured ? "eye" : "eye.slash")
                    .tint(.gray)
            }
            .padding(.trailing, eyeButtonHorizontalPudding)
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView(placeholder: "Password", inputValue: .constant(""))
    }
}
