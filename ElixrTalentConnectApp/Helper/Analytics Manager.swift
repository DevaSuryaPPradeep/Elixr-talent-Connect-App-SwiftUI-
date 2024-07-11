//
//  Analytics Manager.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 10/07/24.
//

import Foundation
import  Firebase

class AnalyticsManager {

    static let shared = AnalyticsManager()
    private init(){}

    func addUserProperty(experienceLevel:String) {
        Analytics.setUserProperty(experienceLevel, forName: .experienceLevelID)
    }

}
