//
//  PasswordField.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 07/03/24.
//

import Foundation
import SwiftUI

/// Passwordfiefd.
struct passwordField: View {
    @Binding var passwordVariable :String 
    let placeHolder :String 
    var body: some View {
        SecureField(placeHolder, text: $passwordVariable)
    }
}
