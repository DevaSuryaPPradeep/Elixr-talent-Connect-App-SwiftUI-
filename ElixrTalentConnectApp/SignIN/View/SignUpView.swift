//
//  SignUpView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import SwiftUI

struct SignUpView: View {
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
    @State var navigationBool : Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                LogoImage(logoName: "Logo 1", width: 100, height: 80)
                    .padding(.leading, 200)
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
                Label(textCaptions: "Create Account.")
                    .padding(.trailing,100)
                    .font(.system(size: 30))
                    .bold()
                List {
                    RoundedRectangles(detailValue: $userName, viewmodel: .fullName)
                    RoundedRectangles(detailValue: $emailAddress, viewmodel: .emailAddress)
                    SecureFields(hidePassword: $hidePasswordBool, secureFieldDetails: $password, viewModel: .password)
                    SecureFields(hidePassword: $hideValue, secureFieldDetails: $confirmPassword, viewModel: .confirmPassword)
                }
                Button {
                    
                    let validationResult = viewModelInstance.validateCredentials(fullName: userName, emailAddress: emailAddress, password: password, confirmPassword: confirmPassword)
                    if validationResult.isValid{
                        navigationBool.toggle()
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
            .navigationDestination(isPresented: $navigationBool, destination: {
                HomeView()
            })
            .alert(isPresented: $alertVaraible, content: {
                Alert(title: Text("Alert"),message: Text (alertMessage),dismissButton: .default(Text("Fix It.")))
            })
                
            .listStyle(.inset)
                Spacer()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
#Preview {
    SignUpView()
}

struct RoundedRectangles: View {
    @Binding var detailValue :String
    let viewmodel :SignUpModel
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(style: StrokeStyle())
                .frame(width: 350,height: 80)
            HStack{
                IconImage(imageValue: viewmodel.iconImage)
                VStack(alignment: .leading, content: {
                    Label(textCaptions: viewmodel.title)
                    Textfields(bindingVariable: $detailValue, placeholder:viewmodel.placeHolder)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                })
            }
            .padding()
        }
    }
}

struct  SecureFields :View {
    @Binding var hidePassword :Bool
    @Binding var secureFieldDetails :String
    let viewModel :SignUpModel
    var body :some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(style: StrokeStyle())
                .frame(width: 350,height: 80)
            HStack {
//                if viewModel.isVisible == true {
                    IconImage(imageValue: viewModel.iconImage)
                    VStack(alignment: .leading, content:{
                        Label(textCaptions: viewModel.title)
                        HStack {
                            if  hidePassword {
                                Textfields(bindingVariable: $secureFieldDetails, placeholder: viewModel.placeHolder)
                            }
                            else {
                                passwordField(passwordVariable: $secureFieldDetails, placeHolder: viewModel.placeHolder)
                            }
                            Button{
                                hidePassword.toggle()
                            }
                        label:{
                            hidePassword ? IconImage(imageValue: "eye"):  IconImage(imageValue: "eye.slash")
                        }
                        }
                    })
                
            }
            .padding()
        }
    }
}


