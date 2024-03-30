//
//  MyjobsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation


class MyjobsVM :ObservableObject{
    
    /// This function get data from the userdefaults by decodimg the from a particular key.
    /// - Returns: Returns an empty array if there is no presaved jobs in the user defalut  or returns an array of job array.
    func getDataFromSafe() -> [Jobs]{
        guard let savedJobData = UserDefaults.standard.data(forKey: .savedJobsID),
              let savedjobs = try? JSONDecoder().decode([Jobs].self, from: savedJobData) else {
            print( "no jobs")
            return []
        }
        print("jobs details=----->\(savedjobs)")
        return savedjobs
    }
    
    /// Search functionality in the my jobs view.
    /// - Parameter searchTerm: Is of type string that is given as the state variable
    /// - Returns: Retruns an array of jobs based on the value in the search bar , or  returns the value returned from the getDataFromSafe function.
    func switchDataWithSearch (_ searchTerm :String) ->[Jobs] {
        let  dataSource = getDataFromSafe()
        guard searchTerm.isEmpty else {
            return dataSource.filter({ details in
                let SearchCriteria = details.location + details.title
                return searchTerm.split(separator: " ").allSatisfy { Substring in
                   SearchCriteria.lowercased().contains(Substring.lowercased())
                }
            })
        }
        return dataSource
    }
}
