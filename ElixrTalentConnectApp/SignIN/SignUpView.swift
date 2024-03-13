//
//  SignUpView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack{
            LogoImage(logoName: "Logo 1", width: 100, height: 80)
                .padding(.leading, 200)
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 40)
                .padding(.trailing, 250)
            Spacer()
            
        }

    }
}

#Preview {
    SignUpView()
}
