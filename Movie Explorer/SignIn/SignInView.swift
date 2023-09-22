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
    
    private let logoSideLength: CGFloat = 100
    private let headerViewHeight: CGFloat = 200
    
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: FocusedField?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
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
            
            Group {
                TextField("SignInView.emailTF", text: $email)
                    .focused($focusedField, equals: .email)
                    .onSubmit {
                        focusedField = .password
                    }
                    .textFieldStyle(InputTextFieldStyle(keyboardType: .emailAddress, submitLabel: .next))
                SecureInputView(placeholder: String(localized: .init(stringLiteral: "SignInView.passwordTF")), inputValue: $password)
                    .focused($focusedField, equals: .password)
                    .onSubmit {
                        focusedField = nil
                    }
                    .textFieldStyle(InputTextFieldStyle(submitLabel: .go))
            }
            .padding(.textFieldHorizontalPadding, .textFieldVerticalPadding)
            .disabled(viewModel.isLoading)
            Spacer()
            Button("SignInView.signInBtn") {
                viewModel.signIn()
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(fieldsNotFilled())
            HStack(spacing: .zero) {
                Text("SignInView.signUpPrompt")
                Button("SignInView.signUpBtn") {
                    
                }
                .tint(.textButtonTint)
            }
            .padding(.vertical)
        }
        .spinner(isPresented: viewModel.isLoading,
                 spinnerView: { AnyView(LottieView(name: "LoadingAnimation")) })
    }
    
    private func fieldsNotFilled() -> Bool {
        password.isEmpty || email.isEmpty
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
