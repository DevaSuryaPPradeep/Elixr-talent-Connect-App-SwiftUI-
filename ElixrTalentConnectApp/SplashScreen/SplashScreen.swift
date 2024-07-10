//
//  SplashScreen.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 06/03/24.
//

import SwiftUI

struct SplashScreen: View {
    
    /// Variable Decarations.
    @State private var isActive: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var isSignedUp :Bool =  false
    
    var body: some View {
        if isActive  {
            if isLoggedIn || isSignedUp {
                 MainTabbarView()
            } else {
                LoginView(isLogedIn: $isLoggedIn, isSignedup: $isSignedUp)
            }
        }
        else  {
            VStack{
                Image("Splash Screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
            .onAppear{
                DispatchQueue.main.async {
                    isActive.toggle()
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
