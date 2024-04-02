//
//  SignUpModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import Foundation


enum SignUpModel {
    
case fullName
    case emailAddress
    case password
    case confirmPassword
}

extension SignUpModel {
    var title:String {
        switch self {
        case .emailAddress :
            return "EMAIL ADDRESS"
        case .fullName:
            return "FULL NAME"
        case .password:
            return "PASSWORD"
        case .confirmPassword:
            return "CONFIRM PASSWORD"
        }
    }
    
    var placeHolder :String {
        switch self {
        case .emailAddress :
             return  "Enter your user name here."
        case .fullName:
            return  "Enter your full  name here."
        case .password:
            return  "Enter your password here."

        case .confirmPassword:
            return  "Re-enter your password here."
        }
    }
    
    var iconImage :String {
        switch self {
        case .fullName:
            return "person"
        case .emailAddress:
            return "envelope"
        case .password:
            return "lock"
        case .confirmPassword:
            return "lock"
        }
    }
    
    var isVisible:Bool {
        switch self {
        case .fullName:
            return false
        case .emailAddress:
            return false
        case .password:
            return true
        case .confirmPassword:
            return true
        }
    }
}
