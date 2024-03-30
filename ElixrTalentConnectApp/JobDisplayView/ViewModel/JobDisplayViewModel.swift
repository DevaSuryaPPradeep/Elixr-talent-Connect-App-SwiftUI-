//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation
import SwiftUI


/// Viewmodel for the home View.
class JobDisplayViewModel:ObservableObject {
    
    /// Published properties & constants declarations.
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    let modelInstance = JobResponse(jobs: [Jobs]())
    
    
    /// Function to perform API  fetch from the API.
    func fetchData() {
        NetworkManger.shared.APICaller(from: .getJobs) { [weak self] (response : Result<JobResponse?, networkErrors>)  in
            guard let self = self  else {
                return
            }
            switch response {
            case .success(let result) :
                DispatchQueue.main.async {
                    if let mydata = result?.jobs{
                        self.jobArray =  mydata
                    }
                }
            case .failure(_):
                print("error--->\(networkErrors.failedtoDecodeResponse)")
            }
        }
    }
    
    
    
    func postJobs(){
        let encodedData = try? JSONEncoder().encode(postDataInstance)
        NetworkManger.shared.APICaller(from: .postJobs, body: encodedData) { [weak self] (response :Result<JobResponse, networkErrors>) in
            guard self != nil else{
                return
        }
            switch response {
            case .success(_):
                print("job Submitted")
            case .failure(let errorMessage):
                print("Job submission failed with error \(errorMessage)")
                break
            }
        }
    }
    
    ///dateFormatter- Takes am input from the home view and passed on to the next function  format helper .
    /// - Parameter dateString: is of type string that is passed from the  api
    /// - Returns: This returns a formatted value of the date value string into specific format as per the requirement.
    func dateFormatter(dateString:String?) ->String? {
        guard let dateString = dateString, let formatedString = formatHelper(dateStringValue: dateString) else{
            return nil
        }
        return formatedString
    }
    
    /// formatHelper - this is a function used to format the date string received from t
    /// - Parameter dateStringValue: This is of type string, that contains the raw string formed date response from the APi response
    /// - Returns: Returns a string value of the date format of type inatnce: - 24th Feb 2003
    func formatHelper(dateStringValue: String?)->String?{
        if let dateStringValue = dateStringValue{
            let dFInstance = DateFormatter()
            dFInstance.dateFormat = "yyyy-MM-dd"
            if let date = dFInstance.date(from: dateStringValue){
                ///For day
                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "d"
                let day = dayFormatter.string(from: date)
                ///For  month.
                let monthFormatter = DateFormatter()
                monthFormatter.dateFormat = "MMM"
                let month =  monthFormatter.string(from: date)
                ///for year
                let yearFormatter = DateFormatter()
                yearFormatter.dateFormat = "yyyy"
                let year =  yearFormatter.string(from: date)
                return ("\(day)\(String(describing: SuffixAppender(DayInstance: day)))\(month)\(year)")
            }
        }
        return dateStringValue
    }
    
    /// Date from the API - 2024-01-10
    ///  Expected output 2nd feb 2024, 1st feb 2024
    
    /// - Parameter DayInstance: Is of type is String that represents the day integer in a date.
    /// - Returns: Which returns a  specifed suffix for the particular day in a date,
    func SuffixAppender(DayInstance:String)->String{
        let dayString = Int(DayInstance) ?? 0
        switch dayString {
        case 1,21,31 :
            return "st"
        case 2,22 :
            return "nd"
        case 3,23:
            return "rd"
        default:
            return "nth"
        }
    }
    
    /// isFavouriteButtonTapped -Creates a userdefault carrier to contain selected jobs.
    /// - Parameter jobID: Is of type String which represents the unique job ID passed from the home view.
    func isFavouriteButtonTapped(jobID:String){
        let isFavourite = UserDefaults.standard.bool(forKey: jobID)
        UserDefaults.standard.set(!isFavourite, forKey: jobID)
    }
    
    
    func fetchData(_ searchTerm :String ) -> [Jobs] {
        guard  searchTerm.isEmpty else {
            return jobArray.filter({ jobDetails in
                let SearchCriteria = jobDetails.location + jobDetails.title
                return searchTerm.split(separator: "").allSatisfy { Substring in
                    SearchCriteria.lowercased().contains(searchTerm.lowercased())
                }
            })
        }
        return jobArray
    }
}
