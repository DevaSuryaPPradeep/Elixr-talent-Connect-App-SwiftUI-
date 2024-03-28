//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

/// Viewmodel for the detalis view.
class jobDetailsVm:ObservableObject{
    
    /// Published Propeerty decalartions to trigger alerts in the View.
    @Published var alertOnDuplicateEntry :Bool = false
    @Published var alertOnSuccessfulEntry :Bool = false
    
    /// favouriteButtonAction - Is a function to set the favourite button action which
    /// - Parameter wishlistVariable: this is the jobID.
    func favouriteButtonAction(_ wishlistVariable :String) {
        let isFavourite = UserDefaults.standard.bool(forKey: wishlistVariable)
        UserDefaults.standard.set(!isFavourite, forKey: wishlistVariable)
    }
    
    /// applyButtonPressed - This function make use of two functions ie, getsavedJobList(),isJobAlreadyApplied() and if both of them is true then it appends to an array and set that array to userdefaults by encoding it.
    /// - Parameter jobInstance: is of type of jobs.
    func applyButtonPressed(_ jobInstance :Jobs){
        var savedArray = getsavedJobList()
        guard  jobInstance == jobInstance , !isJobAlreadyApplied(savedArray, job: jobInstance) else {
            alertOnDuplicateEntry.toggle()
            return
        }
        savedArray.append(jobInstance)
        do {
            let appliedJobInstance = try JSONEncoder().encode(savedArray)
            UserDefaults.standard.set(appliedJobInstance, forKey: .savedJobsID)
            alertOnSuccessfulEntry.toggle()
            print("alertOnSuccessfulEntry---->\(alertOnSuccessfulEntry)")
        }
        catch {
            print("Decoding failed.")
        }
    }
    
    /// This function will help to get the the saved jobs from the  user defaults by decoding it.
    /// - Returns:it got two possibilty either you get an empty array when there is no job is saved in the respective key else it will return  an array of jobs decoded from the userdefaults.
    func getsavedJobList ()->[Jobs]{
        guard let savedJobsData = UserDefaults.standard.data(forKey: .savedJobsID),
              let savedJob = try? JSONDecoder().decode([Jobs].self, from: savedJobsData) else {
            return []
        }
        return savedJob
    }
    
    /// isJobAlreadyApplied- checks whether the same job is applied twice or not.
    /// - Parameters:
    ///   - savedjobs: This array is the container for job type related array
    ///   - job: This is the structure for each job.
    /// - Returns: Returns  a boolean false when savedjobs is empty else it checks whether the savedjobs contain a job with same job id.
    func isJobAlreadyApplied(_ savedjobs:[Jobs],job:Jobs)->Bool{
        guard !savedjobs.isEmpty else{
            return false
        }
        let isApplied = savedjobs.contains(where: {$0.id == job.id})
        return isApplied
    }
}
