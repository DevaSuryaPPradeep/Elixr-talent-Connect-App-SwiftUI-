//
//  Analytics Manager.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 10/07/24.
//

import Foundation
import  Firebase

/// Class to integrate firebase analytics to the propject.
class AnalyticsManager {
    
    /// Singleton implementation
    static let shared = AnalyticsManager()
    private init(){}
    
    /// Function to represents  to store  a value in a user property related to user's experience level.
    /// - Parameter experienceLevel: key for representing the user property.
    func userExperienceLevelProperty(experienceLevel: String) {
        Analytics.setUserProperty(experienceLevel, forName: .experienceLevelID)
    }
    
    /// Function to represents  to store  a value in a user property related to user's job Interest .
    /// - Parameters:
    ///   - jobInterest: Contains the job titile.
    ///   - params: A dictionary value to represent key value associated with logging an event.
    func userJobInteresetEvent(jobInterest: String, params: [String : Any]? = nil) {
        Analytics.logEvent(jobInterest, parameters: params)
    }
    
    /// Function to represents  to store  a value in a user property related to user's interaction with several screems  .
    /// - Parameters:
    ///   - ScreenName: Stores the name of the current screen.
    ///   - params: A dictionary value to represent key value associated with logging an event.
    func aboutScreenEvent(ScreenName: String, params: [String : Any]? = nil){
        Analytics.logEvent(ScreenName, parameters:params)
    }
    
    /// Function to represents  to store  a value in a user property related to user selected favourite jobs  .
    /// - Parameters:
    ///   - favouriteJobId: Unique name defining job titile
    ///   - params: A dictionary value to represent key value associated with logging an event.
    func addFavouriteJobEvent(favouriteJobId: String, params:[String : Any]? = nil) {
        Analytics.logEvent(favouriteJobId, parameters: params)
    }
    
    /// Function to log applied jobs by tracking a button action
    /// - Parameters:
    ///   - favouriteJobName: Unique name defining job titile.
    ///   - params:  A dictionary value to represent key value associated with logging an event.
    func applyForJobsEvent(favouriteJobName: String,params: [String : Any]? = nil) {
        Analytics.logEvent(favouriteJobName, parameters: params)
    }
}
