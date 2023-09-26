//
//  SignUpView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            HeaderWelcomeView(text: String(localized: "SignUpView.welcomeText"))
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
