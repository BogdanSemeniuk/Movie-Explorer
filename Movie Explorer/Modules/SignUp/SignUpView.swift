//
//  SignUpView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct SignUpView<ViewModel: SignUpAbstraction>: View {
    @ObservedObject private var viewModel: ViewModel
    @FocusState private var focusedField: FocusedField?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HeaderWelcomeView(text: "SignUp.welcomeText".localized())
                .frame(height: .welcomeHeaderHeight, alignment: .center)
            
            VStack(spacing: .textFieldVerticalPadding) {
                LabeledTextField(labelText: "SignUp.userNameTF".localized(),
                                 input: $viewModel.userName)
                .textFieldStyle(InputTextFieldStyle(submitLabel: .continue, autocapitalization: .words))
                .focused($focusedField, equals: .userName)
                .onSubmit { focusedField = .password }
                
                VStack(alignment: .leading, spacing: 5) {
                    LabeledTextField(labelText: "SignUp.passwordTF".localized(),
                                     input: $viewModel.password, isSecured: true)
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                    .focused($focusedField, equals: .password)
                    .onSubmit { focusedField = .confirmPassword }
                    Text("SignUp.passwordPrompt")
                        .font(.subheadline)
                        .foregroundColor(.textFieldPrompt)
                }
                
                LabeledTextField(labelText: "SignUp.confirmPasswordTF".localized(),
                                 input: $viewModel.confirmedPassword, isSecured: true)
                .textFieldStyle(InputTextFieldStyle(submitLabel: .continue))
                .focused($focusedField, equals: .confirmPassword)
                .onSubmit { focusedField = .email }
                
                LabeledTextField(labelText: "SignUp.emailTF".localized(),
                                 input: $viewModel.email)
                .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .go))
                .focused($focusedField, equals: .email)
                .onSubmit { focusedField = nil }
            }
            .padding(.horizontal, .textFieldHorizontalPadding)
            
            Spacer()
            Button("SignUp.registerBtn") {
                viewModel.signUp()
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(viewModel.fieldsNotFilled())
            
            PromptWithAction(text: "SignUp.signInPrompt".localized(),
                             actionText: "SignUp.signInBtn".localized()) {
                
            }
            .padding(.vertical)
        }.onTapGesture { focusedField = nil }
        .spinner(isPresented: viewModel.isLoading,
                 spinnerView: { AnyView(LottieView(name: "LoadingAnimation")) })
    }
}

fileprivate extension SignUpView {
    enum FocusedField {
        case email, password, userName, confirmPassword
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
