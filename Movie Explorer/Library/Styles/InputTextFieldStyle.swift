import SwiftUI

struct InputTextFieldStyle: TextFieldStyle {
    
    @FocusState private var isFocused: Bool
    private let keyboardType: UIKeyboardType
    private let submitLabel: SubmitLabel
    
    init(keyboardType: UIKeyboardType = .default, submitLabel: SubmitLabel = .search) {
        self.keyboardType = keyboardType
        self.submitLabel = submitLabel
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .autocorrectionDisabled()
            .autocapitalization(.none)
            .keyboardType(keyboardType)
            .submitLabel(submitLabel)
            .padding(.inputHorizontalPadding, .inputVerticalPadding)
            .background(isFocused ? Color.white : .textFieldBackground)
            .modifier(RoundedViewModifier(strokeWidth: .textFieldBorderWidth,
                                          strokeColor: isFocused ? .main : .lightGray))
            .font(.title3)
            .padding(.textFieldHorizontalPadding, .textFieldVerticalPadding)
            .modifier(ShadowModifier())
            .focused($isFocused)
        }
}

