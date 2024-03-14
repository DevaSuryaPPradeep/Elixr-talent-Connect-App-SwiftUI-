//
//  StringExtensions.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import Foundation
extension String {
    
    /// isValidEmail - a regex method for validating user inputs.
    /// - Returns: bool
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        guard regex.firstMatch(in: self, options: [], range: range) == nil else {
            return true
        }
        return false
    }
    
    var isAlphanumeric: Bool {
           return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil
       }
}
