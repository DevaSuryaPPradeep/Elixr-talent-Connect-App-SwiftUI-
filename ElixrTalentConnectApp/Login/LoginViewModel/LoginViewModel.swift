//
//  LoginViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 06/03/24.
//

import Foundation
import LocalAuthentication

class LoginViewModel :ObservableObject {
    
    /// validateUserCredentials -  validate the user inputs  - email and password field
    /// - Parameter model: Login Model.
    /// - Returns: A Tuple which contains a boolean and a message of type string.
    func validateUserCredentials(model: LoginModel) -> (isValid: Bool, message: String?){
        guard !model.userID.isEmpty else {
            print("empty looop")
            return (false, " Email field is empty.")
        }
        guard model.userID.isValidEmail() else {
            print("empty logic")
            return (false, "Please enter a valid email.")
        }
        guard !model.passwordID.isEmpty else {
            return (false, "Password field is empty.")
        }
        guard model.passwordID.count >= 8 else {
            return (false, "Password must be at least 8 characters long.")
        }
        guard model.passwordID.validPassword() else {
            return (false, "Password must contain alphanumeric characters.")
        }
        // If all checks pass, credentials are valid
        return (true, nil)
    }
    
    /// Biometric Authentication while sign in. Uses LAContext to check user's biiometric policies  in the device. Bas
    /// - Parameter completion: is a completion closure which outlives the present scope since it is using  a @escaping closure.
    func authenticateWithBiometrics(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Biometrics") { (success, evalError) in
                DispatchQueue.main.async {
                    completion(success, evalError)
                }
            }
        } else {
            completion(false, error)
        }
    }
}




