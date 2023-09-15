//
//  SignInView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

struct SignInView: View {
    private let logoSideLength: CGFloat = 100
    private let headerViewHeight: CGFloat = 200
    
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            VStack {
                Image.logo
                    .resizable()
                    .frame(width: logoSideLength, height: logoSideLength)
                Text("SignInView.welcomeText")
                    .font(.title2)
            }
            .frame(height: headerViewHeight, alignment: .center)
            
            
            TextField("SignInView.emailTF", text: $email)
                .focused($focusedField, equals: .email)
                .onSubmit {
                    focusedField = .password
                }
                .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .next))
            SecureField("SignInView.passwordTF", text: $password)
                .focused($focusedField, equals: .password)
                .onSubmit {
                    focusedField = nil
                }
                .textFieldStyle(InputTextFieldStyle(submitLabel: .go))
            Spacer()
            Button("SignInView.signInBtn") {
                print("LOGIN")
            }
            .buttonStyle(ActionButtonStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

fileprivate extension SignInView {
    enum FocusedField {
        case email, password
    }
}
