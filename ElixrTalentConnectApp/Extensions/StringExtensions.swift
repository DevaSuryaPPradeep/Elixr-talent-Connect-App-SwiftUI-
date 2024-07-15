//
//  StringExtensions.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 08/03/24.
//

import Foundation

extension String {
    
    /// Represents a key that represents a user's expenience level.
    static var experienceLevelID = "user_Level"
    
    /// Represents a key that represents a use'rs unique job id .
    static var userKey = "uniqueJobId"
    
    /// Represents a key that represents a user's unique saved job ID.
    static var savedJobsID = "savedJobID"
    
    /// Represents a key that represents a user's current interaction with a screen .
    static var viewIdentifier = "view_name"
    
    /// Represents a key that represents a user's current interaction with a screen, speceifically the screen name .
    static var viewInfoName = "view_info_key"
    
    /// String representing the details of favourite job info.
    static var favouriteJobInfo = "favorite_job_info"
    
    /// String representing the parameter key for favouriteJobInfo.
    static var favouriteJob_key  = "favourite_job_id"
    
    /// String representing the user whether the user is premium or not.
    static var userIsPremiumFlag = "user_is_premium"
    
    /// String representing the selected job
    static var selectedJob = "selected_kob"
    
    /// String representing the viewed jobs.
    static var jobViewed = "job_viewed"
    
    /// isValidEmail - a regex method for validating user inputs.
    /// - Returns: bool
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        guard ((regex.firstMatch(in: self, options: [], range: range) ) == nil)  else {
            return true
        }
        return false
    }
}
