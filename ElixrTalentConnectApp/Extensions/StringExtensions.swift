//
//  StringExtensions.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import Foundation
extension String {
    
    /// isValidEmail - aregex method for validating user inputs.
    /// - Returns: bool
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        guard regex.firstMatch(in: self, options: [], range: range) == nil else {
            return true
        }
        return false
    }
    
    /// validPassword - this is to valdify thr password whether it contains any of alpha numeric values.
    /// - Returns: bool - returns true when the password contains thr alphanumeric characters.
    func  validPassword () -> Bool {
        guard !isEmpty else {
            return false
        }
        let allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let characterSet = CharacterSet(charactersIn: allowed)
        return rangeOfCharacter(from: characterSet.inverted) == nil 
    }
}
