//
//  SignUpViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 13/03/24.
//

import Foundation


class SignUpViewModel :ObservableObject {
    @Published var dataArray :[SignUpModel] = [.fullName,.emailAddress,.password,.confirmPassword]
    
    func validateCredentials(fullName:String?,emailAddress:String?,password:String?,confirmPassword:String?)->(isValid:Bool,message:String?){
        guard let fullName = fullName, !fullName.isEmpty else {
            return (false, "Full name field is required.")
        }
        guard let emailAddress = emailAddress , emailAddress.isValidEmail() else {
            return (false, "Sorry we couldn't recognise this mail,please enter a valid mail ID. ")
        }
        guard let  password = password,!password.isEmpty  else {
            return(false,"password field is empty")
        }
        guard password.count >= 8  else{
            return (false, "Password must be of lenght 8.")
        }
        guard isAlphanumeric(password) else{
            return (false, "Password must contain alphanumeric characters.")
        }
        guard  password == confirmPassword else{
            return (false,"please make sure your password matches.")
        }
        return(true,nil)
    }
        
    
    
    //MARK: -  Alphanumeric authentication functions.
    /// isAlphanumeric - fuction is used to perform alphanumeric authentications.
    /// - Parameter string:type String received from the password textfield
    /// - Returns: return is of type  bool
    func isAlphanumeric(_ string: String) -> Bool {
        let letterSet = CharacterSet.letters
        let digitSet = CharacterSet.decimalDigits
        return !string.isEmpty && string.rangeOfCharacter(from: letterSet) != nil && string.rangeOfCharacter(from: digitSet) != nil
    }
}
