//
//  SignUpView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var userName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        VStack {
            HeaderWelcomeView(text: "SignUp.welcomeText".localized())
                .frame(height: .welcomeHeaderHeight, alignment: .center)
            VStack(spacing: .textFieldVerticalPadding) {
                LabeledTextField(labelText: "SignUp.userNameTF".localized(), input: $userName)
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .continue, autocapitalization: .words))
                    .focused($focusedField, equals: .userName)
                    .onSubmit {
                        focusedField = .password
                    }
                VStack(alignment: .leading, spacing: 5) {
                    LabeledTextField(labelText: "SignUp.passwordTF".localized(), input: $password, isSecured: true)
                        .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                        .focused($focusedField, equals: .password)
                        .onSubmit {
                            focusedField = .confirmPassword
                        }
                    Text("SignUp.passwordPrompt")
                        .font(.subheadline)
                        .foregroundColor(.textFieldPrompt)
                }
                LabeledTextField(labelText: "SignUp.confirmPasswordTF".localized(), input: $confirmedPassword, isSecured: true)
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                    .focused($focusedField, equals: .confirmPassword)
                    .onSubmit {
                        focusedField = .email
                    }
                LabeledTextField(labelText: "SignUp.emailTF".localized(), input: $email)
                    .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .go))
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        focusedField = nil
                    }
            }
            .padding(.horizontal, .textFieldHorizontalPadding)
            Spacer()
            Button("SignUp.registerBtn") {
                
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(false)
            
            PromptWithAction(text: "SignUp.signInPrompt".localized(),
                             actionText: "SignUp.signInBtn".localized()) {
                
            }
            .padding(.vertical)
        }.onTapGesture {
            focusedField = nil
        }
    }
}

fileprivate extension SignUpView {
    enum FocusedField {
        case email, password, userName, confirmPassword
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
