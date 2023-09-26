//
//  SignUpView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct SignUpView: View {
    @State var userName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    
    var body: some View {
        VStack {
            HeaderWelcomeView(text: "SignUp.welcomeText".localized())
                .frame(height: .welcomeHeaderHeight)
            VStack(spacing: .textFieldVerticalPadding) {
                LabeledTextField(labelText: "SignUp.userNameTF".localized(), input: $userName)
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .continue, autocapitalization: .words))
                VStack(alignment: .leading, spacing: 5) {
                    LabeledTextField(labelText: "SignUp.passwordTF".localized(), input: $password, isSecured: true)
                        .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                    Text("SignUp.passwordPrompt")
                        .font(.subheadline)
                        .foregroundColor(.textFieldPrompt)
                }
                LabeledTextField(labelText: "SignUp.confirmPasswordTF".localized(), input: $confirmedPassword, isSecured: true)
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                LabeledTextField(labelText: "SignUp.emailTF".localized(), input: $email)
                    .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .go))
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
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
