//
//  SignInView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI

struct SignInView: View {
    private let logoSideValue: CGFloat = 100
    private let headerViewHeight: CGFloat = 200
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            VStack {
                Image.logo
                    .resizable()
                    .frame(width: logoSideValue, height: logoSideValue)
                Text("Welcome to Movie Explorer")
                    .font(.title2)
            }
            .frame(height: headerViewHeight, alignment: .center)
            
            
            TextField("Email", text: $email)
                .focused($focusedField, equals: .email)
                .onSubmit {
                    focusedField = .password
                }
                .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .next))
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
                .onSubmit {
                    focusedField = nil
                }
                .textFieldStyle(InputTextFieldStyle(submitLabel: .go))
            Spacer()
            
            Button("LOGIN") {
                print("Login")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

extension SignInView {
    enum FocusedField {
        case email, password
    }
}
