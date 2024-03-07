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
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .ignoresSafeArea()
                    .foregroundColor(Color.white)
                    .frame(width: 400, height: 550)
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
                        .frame(width:300, height: 50)
                        .foregroundStyle(Color.gray)
                        .opacity(0.5)
                        .overlay {
                            HStack {
                                ImageView(imageValue: "envelope")
                                Textfields(bindingVariable: userIDValue,placeholder: "Email")
                            }
                            .padding()
                        }
                    RoundedRectangle(cornerRadius: 10.0)
                        .frame(width:300, height: 50)
                        .foregroundStyle(Color.gray)
                        .opacity(0.5)
                        .overlay {
                            HStack {
                              ImageView(imageValue: "lock")
                                Textfields(bindingVariable: passwordKey,placeholder: "Password")
                            }
                            .padding()
                        }
                    Spacer()
                }
                .padding(.all)
                
                Spacer()
            }
            .padding(.all)
        }
    }
}

#Preview {
    LoginView()
}



struct Label: View {
    let textCaptions :String?
    var body: some View {
        Text (textCaptions ??  "textCaptions")
    }
}

struct Textfields: View {
    @State var bindingVariable:String = ""
    @State var placeholder:String?
    var body: some View {
        TextField (placeholder ?? "placeHolder", text: $bindingVariable)
//            .frame(width: 300,height:50)
//            .background(Color.gray)
//            .opacity(0.5)
//            .clipShape(RoundedRectangle(cornerRadius: 10.0))
//            .padding()
    }
}

struct ImageView: View {
    @State var imageValue :String?
    var body: some View {
        Image(systemName: imageValue ?? "envelope")
            .foregroundStyle(Color.orange)
    }
}
