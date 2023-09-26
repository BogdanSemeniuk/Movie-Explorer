//
//  PromptWithAction.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct PromptWithAction: View {
    private var text: String
    private var actionText: String
    private var action: () -> Void
    
    init(text: String, actionText: String, action: @escaping () -> Void) {
        self.text = text
        self.actionText = actionText
        self.action = action
    }
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(text)
            Button(actionText, action: action)
            .tint(.textButtonTint)
        }
    }
}

struct PromptWithAction_Previews: PreviewProvider {
    static var previews: some View {
        PromptWithAction(text: String(localized: "SignIn.signUpPrompt"),
                         actionText:  String(localized: "SignIn.signUpBtn"),
                         action: {})
    }
}
