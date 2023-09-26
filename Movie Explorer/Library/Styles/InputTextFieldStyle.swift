import SwiftUI

struct InputTextFieldStyle: TextFieldStyle {
    
    @FocusState private var isFocused: Bool
    private let keyboardType: UIKeyboardType
    private let submitLabel: SubmitLabel
    private let autocapitalization: UITextAutocapitalizationType
    
    init(keyboardType: UIKeyboardType = .default,
         submitLabel: SubmitLabel = .search,
         autocapitalization: UITextAutocapitalizationType = .none) {
        self.keyboardType = keyboardType
        self.submitLabel = submitLabel
        self.autocapitalization = autocapitalization
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .autocorrectionDisabled()
            .autocapitalization(autocapitalization)
            .keyboardType(keyboardType)
            .submitLabel(submitLabel)
            .padding(.inputHorizontalPadding, .inputVerticalPadding)
            .background(isFocused ? Color.white : .textFieldBackground)
            .modifier(RoundedViewModifier(strokeWidth: .textFieldBorderWidth,
                                          strokeColor: isFocused ? .main : .lightGray))
            .font(.title3)
            .modifier(ShadowModifier())
            .focused($isFocused)
        }
}

