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
    
    /// StateObject declarations.
    @StateObject var loginViewModelInstance = LoginViewModel()
    
    /// State variable declarations.
  
    @State var isValid: Bool = false
    @State var alertVariable: Bool = false
    @State var message :String = ""
    @State var signUpBool :Bool = false
    
    /// Binding property declarations.
    @Binding var isLogedIn: Bool
    @Binding var isSignedup: Bool
    
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                ZStack {
                    RoundedRectangleView
                    BackGroundImage()
                    VStack {
                        HeadingView
                        Spacer()
                        Group{
                            emailView
                                .padding(.top,-50)
                            passwordView
                        }
                        .padding(.top,-50)
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
        VStack(spacing: 10, content: {
            Label(textCaptions: "Login")
                .font(.title)
                .bold()
                .padding(.leading,-88)
            Label(textCaptions: "Please sign-in to login.")
                .font(.headline)
        })
        .padding(.init(top: 10.0, leading: -80, bottom: 1, trailing: 20))
    }
    
    /// emailView - give user acessible  email fields.
    private var emailView:some View {
        HStack {
            IconImage(imageValue: "envelope")
                .padding(3)
            Textfields(bindingVariable: $loginViewModelInstance.userIDValue,placeholder: "Email")
        }
        .frame(width: 300,height: 40)
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .cornerRadius(10.0)
        .padding()
    }
    
    /// PassswordView - contains user interactable password fields.
    private var passwordView :some View {
        HStack {
            IconImage(imageValue: "lock")
                .padding(3)
            passwordField(passwordVariable: $loginViewModelInstance.passwordKey, placeHolder: "Enter the password here.")
        }  .frame(width: 300,height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .background(Color.gray.opacity(0.3))
            .foregroundStyle(Color.elixrlightGray)
            .cornerRadius(10.0)
            .padding()
    }
    
    /// signInButton - contains signinButton
    private var signInButton :some View {
        Button {
            let validationResult = loginViewModelInstance.validateUserCredentials(model: LoginModel(userID: loginViewModelInstance.userIDValue, passwordID: loginViewModelInstance.passwordKey))
            if validationResult.isValid {
                loginViewModelInstance.authenticateWithBiometrics {  (success, error) in
                    if success {
                        CrashAnalyticsManger.shared.setUserId(userID: loginViewModelInstance.userIDValue)
                        isLogedIn.toggle()
                    } else {
                        print("Authentication Failed")
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
            .padding()
    }
    /// Signuprompt -  contains label and a sign in button.
    private var signUpPrompt :some View {
        HStack{
            Label(textCaptions: "Don't have an account?")
                .foregroundStyle(Color.black)
            Button {
                signUpBool.toggle()
                //isSignedup.toggle()
            } label: {
                Label(textCaptions: "Signup")
                    .foregroundStyle(Color.orange)
                    .fontWeight(.medium)
            }
            .navigationDestination(isPresented: $signUpBool) {
                SignUpView( isSignedIn: $isSignedup)
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
    LoginView( isLogedIn: .constant(false), isSignedup: .constant(false))
}

