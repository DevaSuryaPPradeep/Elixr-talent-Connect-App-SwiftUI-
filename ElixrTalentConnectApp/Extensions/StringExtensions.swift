//
//  StringExtensions.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import Foundation
extension String {
    
    /// isValidEmail - this Regex functionality is used to validify the email typed in by the username
    /// - Returns: returns true  if the mandidate criterias are met in the validation check, and returns false while the meandidate fields are not found based on this return type alert is triggered.
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        guard regex.firstMatch(in: self, options: [], range: range) == nil else {
            return true
        }
        return false
    }
    
    /// validPassword - this functionality is used to validy the passworf entry of the user
    /// - Returns: Returns a boolean value , based on the presence of the alphanumeric values the return value is determined , and on returning a false value an alert is trigered.
    func  validPassword () -> Bool {
        guard !isEmpty else {
            return false
        }
        let allowed = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let characterSet = CharacterSet(charactersIn: allowed)
        return rangeOfCharacter(from: characterSet.inverted) == nil 
    }
}
