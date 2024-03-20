////
////  RoundedSecurefields.swift
////  ElixrTalentConnectApp
////
////  Created by Devasurya on 14/03/24.
////
//
//import Foundation
//import SwiftUI
//
//struct  SecureFields :View {
//    @Binding var hidePassword :Bool
//    @Binding var secureFieldDetails :String
//    let viewModel :SignUpModel
//    var body :some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 5.0)
//                .stroke(style: StrokeStyle())
//                .frame(width: 350,height: 80)
//            HStack {
//                if viewModel.isVisible == true {
//                    IconImage(imageValue: viewModel.iconImage)
//                    VStack(alignment: .leading, content:{
//                        Label(textCaptions: viewModel.title)
//                        HStack {
//                            if  hidePassword {
//                                Textfields(bindingVariable: $secureFieldDetails, placeholder: viewModel.placeHolder)
//                                    .padding(.bottom,5)
//                            }
//                            else {
//                                passwordField(passwordVariable: $secureFieldDetails, placeHolder: viewModel.placeHolder)
//                                    .padding(.top,-5)
//
//                            }
//                            Button{
//                                hidePassword.toggle()
//                            }
//                        label:{
//                            hidePassword ? IconImage(imageValue: "eye"):  IconImage(imageValue: "eye.slash")
//                        }
//                        }
//                    })
//                }
//            }
//            .padding()
//            
//        }
//    }
//}
