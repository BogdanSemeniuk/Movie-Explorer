//
//  HeaderWelcomeView.swift
//  Movie Explorer
//
//  Created by Богдан Семенюк on 26.09.2023.
//

import SwiftUI

struct HeaderWelcomeView: View {
    private var text: String
    private let logoSideLength: CGFloat = 100
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack {
            Image.logo
                .resizable()
                .frame(width: logoSideLength, height: logoSideLength)
            Text(text)
                .font(.title2)
        }
    }
}

struct HeaderWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderWelcomeView(text: String(localized: "SignInView.welcomeText"))
    }
}
