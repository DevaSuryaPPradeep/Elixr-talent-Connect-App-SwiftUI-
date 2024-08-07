//
//  SignUpView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import SwiftUI

/// View for the signUp.
struct SignUpView: View {
    
    /// Stateobject declaration of type SignUpViewModel.
    @StateObject var viewModelInstance: SignUpViewModel = SignUpViewModel()
    
    /// @Environment  varible declaration to dismiss a view.
    @Environment(\.presentationMode) var presentationMode
    
    /// State variable to represent email address.
    @State var emailAddress :String = ""
    
    /// State variable to represent user name
    @State var  userName :String = ""
    
    /// State variable to represent password.
    @State var  password :String = ""
    
    /// State variable to confirm the password.
    @State var  confirmPassword :String = ""
    
    /// State variable to trigger an alert event.
    @State var alertVaraible :Bool = false
    
    /// State variable to store an alert message when a alert is triggered.
    @State var alertMessage: String = ""
    
    /// State variable to trigger a navigation event.
    @State var isPresented: Bool = false
    
    ///State varible to store the value of user as premium or not.
    @State var isPremiumUser: Bool = false
    
    /// @binding property to let the view hierachy inform about the rootview.
    @Binding var isSignedIn: Bool
    
    var body: some View {
        VStack{
            logo
            backButton
            titleTag
            listView
            signUPButton
                .navigationDestination(isPresented: $isPresented, destination: {
                    MainTabbarView()
                })
                .alert(isPresented: $alertVaraible, content: {
                    Alert(title: Text("Alert"),message: Text (alertMessage),dismissButton: .default(Text("Fix It.")))
                })
            toggleButton
            signInprompt
                .listStyle(.inset)
            Spacer()
                .navigationBarBackButtonHidden()
        }
        .onAppear {
            AnalyticsManager.shared.aboutScreenEvent(ScreenName: .viewIdentifier, params: [.viewInfoName : "SignUpView"])
        }
    }
    
    /// Contains the logo.
    private var logo :some View {
        LogoImage(logoName: "Logo 1", width: 100, height: 80)
            .padding(.leading, 200)
    }
    
    /// contains a back button.
    private var backButton:some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 40)
                .padding(.trailing, 250)
                .foregroundStyle(Color.black)
        }
        .padding(.leading,-40)
    }
    
    /// contains the title tag.
    private var titleTag :some View{
        Label(textCaptions: "Create Account.")
            .padding(.trailing,100)
            .font(.system(size: 30))
            .bold()
    }
    
    /// Contains the  list.
    private var listView :some View {
        List(viewModelInstance.dataArray,id: \.self) {value in
            signUpFields(spModel: value, textValue: setupSignup(for: value))
        }
    }
    
    /// Contains the sign up button.
    private var signUPButton :some View {
        Button {
            let validationResult = viewModelInstance.validateCredentials(fullName: userName, emailAddress: emailAddress, password: password, confirmPassword: confirmPassword)
            if validationResult.isValid{
                isPresented.toggle()
                isSignedIn.toggle()
                CrashAnalyticsManger.shared.setUserId(userID: userName)
                CrashAnalyticsManger.shared.addCrashLogs(message: "Crashed appeared while Signing up.")
            }
            else {
                alertMessage = validationResult.message ?? "Unknown error"
                alertVaraible.toggle()
            }
        }
    label: {
        Text ("Sign Up")
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(width: 300,height: 40)
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
    }
    /// Contains the sign in button along with a prompt.
    private var signInprompt :some View {
        HStack{
            Label(textCaptions: "Don't have an account ?")
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }
        label: {
            Text("sign In")
                .foregroundStyle(Color.orange)
        }
        }
    }
    
    /// Contains the sign in button along with a prompt.
    private var toggleButton :some View {
        HStack{
            Text("Tap to check premium features")
            Toggle(isOn: $isPremiumUser, label: {
                Text( isPremiumUser ? "On" : "OFF")
            })
            .toggleStyle(.button)
            .onChange(of: isPremiumUser) { _,newValue in
                if newValue {
                    CrashAnalyticsManger.shared.setUserKey(customValue: "Premium", key: .userIsPremiumFlag)
                }
                else {
                    CrashAnalyticsManger.shared.setUserKey(customValue: "Normal", key: .userIsPremiumFlag)
                }
            }
        }
    }
    
    /// Private function to set binding property for each category of the textfield.
    /// - Parameter variable: Defines an instance of the signup model
    /// - Returns: Returns a binding property to binded with each textfield.
    private func setupSignup (for variable :SignUpModel)->Binding<String> {
        switch variable {
        case .fullName:
            return $userName
        case .emailAddress:
            return $emailAddress
        case .password:
            return $password
        case .confirmPassword:
            return $confirmPassword
        }
    }
}
#Preview {
    SignUpView(isSignedIn: .constant(true))
}

/// View representing user interactive textfield with a icon.
struct signUpFields :View {
    
    /// Instance of the signup model
    let spModel :SignUpModel
    
    /// State variable to swap between normal textfield and securefield.
    @State var isHidden: Bool = false
    
    /// Creates unitque binding property for  each textfield.
    @Binding var  textValue :String
    
    var body: some View {
        HStack{
            IconImage(imageValue: spModel.iconImage)
                .font(.title3)
                .padding()
            VStack(alignment: .leading, content: {
                Text(spModel.title)
                if spModel.isVisible {
                    HStack{
                        if isHidden {
                            passwordField(passwordVariable: $textValue, placeHolder: spModel.placeHolder)
                        }
                        else{
                            Textfields(bindingVariable: $textValue, placeholder: spModel.placeHolder)
                        }
                        Button {
                            isHidden.toggle()
                        }label: {
                            Image(systemName: isHidden ? "eye" : "eye.slash")
                                .foregroundStyle(Color.black)
                        }
                    }
                }
                else {
                    Textfields(bindingVariable: $textValue, placeholder: spModel.placeHolder)
                }
            })
        }
    }
}


