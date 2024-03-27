//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

/// Viewmodel for the detalis view.
class jobDetailsVm:ObservableObject{
    @Published var alertOnDuplicateEntry :Bool = false
    @Published var alertOnSuccessfulEntry :Bool = false
//    @Published var  favouriteButtonBool :Bool = false
    
    /// favouriteButtonAction - Is a function to set the favourite button action which
    /// - Parameter wishlistVariable: <#wishlistVariable description#>
    func favouriteButtonAction(_ wishlistVariable :String) {
        let isFavourite = UserDefaults.standard.bool(forKey: wishlistVariable)
        print("isFavourite-->\(isFavourite)")
//        favouriteButtonBool = UserDefaults.standard.bool(forKey: wishlistVariable)
        UserDefaults.standard.set(!isFavourite, forKey: wishlistVariable)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
            print(alertOnSuccessfulEntry)
        }
        catch {
            print("Decoding failed.")
        }
    }
    
    func getsavedJobList ()->[Jobs]{
        guard let savedJobsData = UserDefaults.standard.data(forKey: .savedJobsID),
              let savedJob = try? JSONDecoder().decode([Jobs].self, from: savedJobsData) else {
            return []
        }
        return savedJob
    }
    //if saved jobs  is  empty then else block.
    func isJobAlreadyApplied(_ savedjobs:[Jobs],job:Jobs)->Bool{
        guard !savedjobs.isEmpty else{
            return false
        }
        let isApplied = savedjobs.contains(where: {$0.id == job.id})
        return isApplied
        }
    }

// MARK: - Functions to  perform Favourite Button action.
/// checkifValuePresent-
/// - Parameters: wishListVariable -of type String,isFavorite - of type Bool.
///   - wishListVariable: wishListVariable description- This contains the jobID.
///   - isFavorite: Is a bool variable to hold the boolean value which will change based on the value  of userInteraction with the favourite button.
//    func checkifValuePresent(wishListVariable: String?, isFavourite: Bool) {
//        guard let uniqueJobId = wishListVariable else {
//            return
//        }
//        UserDefaults.standard.set(isFavourite, forKey: uniqueJobId)
//    }
//
//    /// actionOnCheck- This checks whether the userdefault contains a value or not , if it doesn't contains then the function is returned else it returns the value stored in the userdefault with id uniqueJjobId.
//    /// - Parameter wishListVariable: /
//    /// - Returns: <#description#>
//    func actionOnCheck(wishListVariable: String?) -> Bool {
//        guard let uniqueJobId = wishListVariable else {
//            return false
//        }
//
//        return UserDefaults.standard.bool(forKey: uniqueJobId)
//    }
