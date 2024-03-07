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
    @State var passwordVariable :String = ""
    var body: some View {
        SecureField("Password", text: $passwordVariable)
    }
}
