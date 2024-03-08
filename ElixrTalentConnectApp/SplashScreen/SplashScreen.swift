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
    
    var body: some View {
        if isActive {
            LoginView()
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
