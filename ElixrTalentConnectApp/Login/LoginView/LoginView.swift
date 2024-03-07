//
//  ContentView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

/// view
struct LoginView: View {
    
    /// Variable declarations.
    @State var userIDValue :String = ""
    @State var passwordKey :String = ""
    
    var body: some View {
        VStack{
            Spacer()
            Image("Logo 1")
                .resizable()
                .scaledToFit()
                .frame(width: 270,height: 400)
                .padding(.top,100)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .ignoresSafeArea()
                    .foregroundColor(Color.white)
                    .frame(width: 400, height: 600)
                    .shadow(radius: 10)
                Image("backgroundIMG")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                VStack {
                    Label(textCaptions: "Login")
                        .font(.title)
                        .bold()
                        .padding(.leading,-150)
                    Label(textCaptions: "Please sign-in to login.")
                        .font(.headline)
                        .padding(.leading,-118)
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width:300, height: 40)
                        .foregroundStyle(Color.gray)
                        .opacity(0.5)
                        .overlay {
                            HStack {
                                ImageView(imageValue: "envelope")
                                Textfields(bindingVariable: userIDValue,placeholder: "Email")
                            }
                            .padding()
                        }
                        .padding()
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width:300, height: 40)
                        .foregroundStyle(Color.gray)
                        .opacity(0.5)
                        .overlay {
                            HStack {
                                ImageView(imageValue: "lock")
                                Textfields(bindingVariable: passwordKey,placeholder: "Password")
                            }
                            .padding()
                        }
                    Button {
                        print("signed-in")
                    } label: {
                        Label(textCaptions: "Sign In")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .frame(width: 300,height: 40)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                    .padding()
                    HStack{
                        Label(textCaptions: "Don't have an account?")
                            .foregroundStyle(Color.black)
                        Button {
                            print ("Signup ")
                        } label: {
                           Label(textCaptions: "Signup")
                                .foregroundStyle(Color.orange)
                                .fontWeight(.medium)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .padding(.all)
            }
        }
    }
}
#Preview {
    LoginView()
}

