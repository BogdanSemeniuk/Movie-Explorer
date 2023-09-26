//
//  SignInView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 14.09.2023.
//

import SwiftUI
import ActivityKit

struct SignInView<ViewModel: SignInAbstraction>: View {
    @ObservedObject private var viewModel: ViewModel
    @FocusState private var focusedField: FocusedField?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HeaderWelcomeView(text: "SignIn.welcomeText".localized())
                .frame(height: .welcomeHeaderHeight)
            
            Group {
                TextField("SignIn.emailTF", text: $viewModel.email)
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        focusedField = .password
                    }
                    .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .next))
                SecureInputView(placeholder: "SignIn.passwordTF".localized(), inputValue: $viewModel.password)
                    .focused($focusedField, equals: .password)
                    .onSubmit {
                        focusedField = nil
                    }
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .go))
            }
            .padding(.textFieldHorizontalPadding, .textFieldVerticalPadding)
            .disabled(viewModel.isLoading)
            
            Spacer()
            Button("SignIn.signInBtn") {
                viewModel.signIn()
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(viewModel.fieldsNotFilled())
            PromptWithAction(text: "SignIn.signUpPrompt".localized(),
                             actionText: "SignIn.signUpBtn".localized()) {
                
            }
            .padding(.vertical)
        }
        .onTapGesture {
            focusedField = nil
        }
        .spinner(isPresented: viewModel.isLoading,
                 spinnerView: { AnyView(LottieView(name: "LoadingAnimation")) })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}

fileprivate extension SignInView {
    enum FocusedField {
        case email, password
    }
}
