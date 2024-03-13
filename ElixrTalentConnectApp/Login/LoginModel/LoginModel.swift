//
//  LoginModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 06/03/24.
//

import Foundation

/// Model for Login
struct LoginModel:Identifiable {
    let id: String = UUID().uuidString
    let userID :String
    let passwordID :String
}
