//
//  RoundedSecurefields.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 14/03/24.
//

import Foundation
import SwiftUI

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
                if viewModel.isVisible == true {
                    IconImage(imageValue: viewModel.iconImage)
                    VStack(alignment: .leading, content:{
                        Label(textCaptions: viewModel.title)
                        HStack {
                            if  hidePassword {
                                Textfields(bindingVariable: $secureFieldDetails, placeholder: viewModel.placeHolder)
                                    .padding(.bottom,5)
                            }
                            else {
                                passwordField(passwordVariable: $secureFieldDetails, placeHolder: viewModel.placeHolder)
                                    .padding(.top,-5)
                                
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
            }
            .padding()
            
        }
    }
}



//struct signUpFields :View{
//    let signUpModel :SignUpModel
//    @Binding var textValue :String
//    @State var isSeccureTextEntry :Bool = true
//    var body: some View {
//        NavigationStack {
//            HStack{
//                IconImage(imageValue: signUpModel.iconImage)
//                VStack (alignment: .leading
//                        , content: {
//                    Text(signUpModel.title)
//                    HStack {
//                        if signUpModel.isVisible {
//                            if isSeccureTextEntry {
//                                passwordField(passwordVariable: $textValue, placeHolder: signUpModel.placeHolder)
//                            }
//                            else{
//                                Textfields(bindingVariable: $textValue, placeholder: signUpModel.placeHolder)
//                            }
//                            Button{
//                                isSeccureTextEntry.toggle()
//                            }
//                        label:{
//                            isSeccureTextEntry ? IconImage(imageValue: "eye"):  IconImage(imageValue: "eye.slash")
//                        }
//                        }
//                    }
//                }
//                )}
//        }
//    }
//}
//var title:String {
//    switch self {
//    case .emailAddress :
//        return "EMAIL ADDRESS"
//    case .fullName:
//        return "FULL NAME"
//    case .password:
//        return "PASSWORD"
//    case .confirmPassword:
//        return "CONFIRM PASSWORD"
//    }
