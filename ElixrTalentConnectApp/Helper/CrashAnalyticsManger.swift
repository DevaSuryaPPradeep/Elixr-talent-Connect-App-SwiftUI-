//
//  CrashAnalyticsManger.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 12/07/24.
//

import Foundation
import FirebaseCrashlytics

class CrashAnalyticsManger {
    
    static let shared = CrashAnalyticsManger()
    private init(){}
    
    /// Functon to set user id for the customers.
    /// - Parameter userID: Is a string value representing the userID.
    func setUserId(userID: String) {
        Crashlytics.crashlytics().setUserID(userID)
        print("userID-->\(userID)")
    }
    
    /// Function to set up a custom value against a key.
    /// - Parameters:
    ///   - customValue: Is a string value descibing a unique value of the user
    ///   - key:Is a string value that stores the custom value in dictionary patternr
    func setUserKey(customValue: String,key: String) {
        Crashlytics.crashlytics().setCustomValue(customValue, forKey: key)
    }
    
    /// Function to set up crash logs to recognize more about crashes
    /// - Parameter message: Is a detailed value through which the crash can be logged.
    func addCrashLogs(message: String) {
        Crashlytics.crashlytics().log(message)
    }
    
}
