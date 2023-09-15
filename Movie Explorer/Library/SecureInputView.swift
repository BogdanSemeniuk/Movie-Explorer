//
//  SecureInputView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 15.09.2023.
//

import SwiftUI

struct SecureInputView: View {
    var placeholderLocalizationKey = "SignInView.passwordTF"
    @Binding var inputValue: String
    
    private let eyeButtonHorizontalPudding: CGFloat = 15
    @State private var isSecured = true
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(String(localized: String.LocalizationValue(placeholderLocalizationKey)), text: $inputValue)
                } else {
                    TextField(String(localized: String.LocalizationValue(placeholderLocalizationKey)), text: $inputValue)
                }
            }
            Button {
                isSecured.toggle()
            } label: {
                (isSecured ? Image.eye : Image.eyeSlash)
                    .tint(.eye)
            }
            .padding(.trailing, eyeButtonHorizontalPudding)
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView(inputValue: .constant(""))
    }
}
