//
//  ContentView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI
import LocalAuthentication

/// View
struct LoginView: View {
    
    /// Variable declarations.
    @State var userIDValue: String = ""
    @State var passwordKey: String = ""
    @StateObject var viewModelInstance = LoginViewModel()
    @State var isValid: Bool = false
    @State var alertVariable: Bool = false
    @State var message :String = ""
    @State var signUpBool :Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                headerView
                ZStack {
                    RoundedRectangleView
                    BackGroundImage()
                    VStack {
                        HeadingView
                        emailView
                        passwordView
                        signInButton
                        signUpPrompt
                        Spacer()
                    }
                    .padding(.all)
                }
            }
        }
    }
    
    /// headerView which contains the logo image
    private var headerView: some View {
        Group {
            LogoImage(logoName: "Logo 1",width:275, height: 400)
        }
    }
    /// Rounded rectangle view which act as a container for other UI elements.
    private var RoundedRectangleView :some View {
        RoundedRectangle(cornerRadius: 25.0)
            .ignoresSafeArea()
            .foregroundColor(Color.white)
            .frame(width: 400, height: 600)
            .shadow(radius: 10)
    }
    /// Heading to the user interactivew
    private var HeadingView:some View {
        Group{
            Label(textCaptions: "Login")
                .font(.title)
                .bold()
                .padding(.leading,-150)
            Label(textCaptions: "Please sign-in to login.")
                .font(.headline)
                .padding(.leading,-118)
        }
    }
    /// emailView - give user acessible  email fields.
    private var emailView:some View {
        HStack {
            ImageView(imageValue: "envelope")
                .padding(3)
            Textfields(bindingVariable: $userIDValue,placeholder: "Email")
        }
        .frame(width: 300,height: 40)
        .background(Color.white)
        .border(Color.gray, width: 1)
        .opacity(0.4)
        .cornerRadius(10.0)
        .padding()
    }
    /// PassswordView - contains user interactable password fields.
    private var passwordView :some View {
        HStack {
            ImageView(imageValue: "lock")
                .padding(3)
         passwordField(passwordVariable: $passwordKey)
        } .frame(width: 300,height: 40)
            .background(Color.white)
            .border(Color.gray, width: 1)
            .opacity(0.4)
            .cornerRadius(10.0)
            .padding()
    }
    /// signInButton - contains signinButton
    private var signInButton :some View {
        Button {
            let validationResult = viewModelInstance.validateUserCredentials(model: LoginModel(userID: userIDValue, passwordID: passwordKey))
            if validationResult.isValid {
                viewModelInstance.authenticateWithBiometrics {  (success, error) in
                    if success {
                        print("Authentivation successful")
                        isValid.toggle()
                    } else {
                        print("Authentivation Failed")
                    }
                }
            } else {
                message = validationResult.message ?? "error"
                alertVariable.toggle()
            }} label: {
                Label(textCaptions: "Sign In")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(width: 300,height: 40)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .alert(isPresented: $alertVariable, content: {
                Alert(title: Text("Alert"),message: Text(message),dismissButton: .cancel())
            })
            .navigationDestination(isPresented: $isValid, destination: {
               HomeView()
            })
            .padding()
    }
    /// Signuprompt -  contains label and a sign in button.
    private var signUpPrompt :some View {
        HStack{
            Label(textCaptions: "Don't have an account?")
                .foregroundStyle(Color.black)
            Button {
                signUpBool.toggle()
            } label: {
                Label(textCaptions: "Signup")
                    .foregroundStyle(Color.orange)
                    .fontWeight(.medium)
            }
            .navigationDestination(isPresented: $signUpBool) {
                SignUpView()
            }
            Spacer()
        }
        .padding(.leading,60)
    }
    /// BackGroundImage
    struct BackGroundImage: View {
        var body: some View {
            Image("backgroundIMG")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
    }
    
}
#Preview {
    LoginView()
}

