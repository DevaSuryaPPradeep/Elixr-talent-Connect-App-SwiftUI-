//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

/// Viewmodel for the detalis view.
class jobDetailsVm:ObservableObject{
    
    /// Published Property declarations.
    @Published var alertOnDuplicateEntry :Bool = false
    @Published var alertOnSuccessfulEntry :Bool = false
    @Published var dataSource :[Jobs] = []
    
    /// favouriteButtonAction - Is a function to set the favourite button action which
    /// - Parameter wishlistVariable: this is the jobID.
    func favouriteButtonAction(_ wishlistVariable :String) {
        let isFavourite = UserDefaults.standard.bool(forKey: wishlistVariable)
        UserDefaults.standard.set(!isFavourite, forKey: wishlistVariable)
    }
    
    /// applyButtonPressed - This function returns the prompt message that is required  as the alert in the view.
    /// - Parameter jobInstance: Is of type of jobs.
    /// - Returns: Returns the prompt message that is required  as the alert in the view.
    func applyButtonPressed(_ jobInstance :Jobs)->String? {
        dataSource = getsavedJobList()
        guard  jobInstance == jobInstance , !isJobAlreadyApplied(job: jobInstance) else {
            alertOnDuplicateEntry.toggle()
            return "You have already applied for this job once."
        }
        dataSource.append(jobInstance)
        dataCast(dataSource)
        return "Job applied successfully."
    }
    
    /// dataCast - this functoin is responsible for encoding and inserting the applied jobs into the user defaults.
    /// - Parameter savedDataSource: This data which contain the newly applied jobs.
    func dataCast(_ savedDataSource:[Jobs]) {
        do {
            let appliedJobInstance  = try JSONEncoder().encode(savedDataSource)
            UserDefaults.standard.set(appliedJobInstance, forKey: .savedJobsID)
        }
        catch {
            print( " Error while encoding")
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
    ///   - job: This is the structure for each job.
    /// - Returns: Returns  a boolean value based on the pressence of the job ID in the present array matches the ID returned from the data model.
    func isJobAlreadyApplied(job:Jobs)->Bool{
        let isApplied = dataSource.contains(where: {$0.id == job.id})
        return isApplied
    }
}

