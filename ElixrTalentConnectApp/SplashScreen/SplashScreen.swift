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
    
    var body: some View {
        if isActive {
            if isLoggedIn {
                 MainTabbarView()
            } else {
                LoginView(isLogedIn: $isLoggedIn)
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
                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                    isActive.toggle()
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
