//
//  ContentView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Image("Logo 1")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 500)
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundStyle(Color.gray)
                    .border(Color.black, width: 1)
                    .frame(width: 400, height: 500)
                    .ignoresSafeArea(edges: .all)
                    .shadow(color: Color.black, radius: 10)
                    .overlay {
                        Image("backgroundIMG")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .frame(width: 400, height: 500)
                            .ignoresSafeArea(edges: .all)
                    }
                HStack {
                    VStack(alignment: .leading, content: {
                        Text("Login")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Please sign-In to login")
                    })
                    .padding(50)
                    Spacer()
                }
                VStack{
                    
                }
            }
        }
    }
}
#Preview {
    LoginView()
}
