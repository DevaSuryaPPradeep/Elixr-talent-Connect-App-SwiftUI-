//
//  SignUpView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import SwiftUI

/// View for the signUp.
struct SignUpView: View {
    
    /// Variable declarations.
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModelInstance = SignUpViewModel()
    @State var emailAddress :String = ""
    @State var  userName :String = ""
    @State var  password :String = ""
    @State var  confirmPassword :String = ""
    @State var hidePasswordBool :Bool = false
    @State var hideValue :Bool = false
    @State var alertVaraible :Bool = false
    @State var alertMessage :String = ""
    @State var isPresented : Bool = false
    
    var body: some View {
        NavigationStack{
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
              signInprompt
                .listStyle(.inset)
                Spacer()
                    .navigationBarBackButtonHidden()
            }
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
    SignUpView()
}

struct signUpFields :View {
    let spModel :SignUpModel
    @State var isHidden: Bool = false
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


