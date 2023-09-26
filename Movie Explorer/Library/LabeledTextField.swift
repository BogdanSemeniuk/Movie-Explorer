//
//  LabeledTextField.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct LabeledTextField: View {
    private var labelText: String
    private var input: Binding<String>
    private var isSecured: Bool
    
    init(labelText: String, input: Binding<String>, isSecured: Bool = false) {
        self.labelText = labelText
        self.input = input
        self.isSecured = isSecured
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(labelText)
                .font(.title3)
            if isSecured {
                SecureField("", text: input)
            } else {
                TextField("", text: input)
            }
        }
    }
}

struct LabeledTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextField(labelText: "User name", input: .constant(""))
    }
}
