//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation
import SwiftUI


/// Viewmodel for the home View.
class HomeViewModel:ObservableObject {
    
    /// Published properties & constants declarations.
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    let modelInstance = JobResponse(jobs: [Jobs]())
    
    
    /// Function to perform API  fetch from the API.
    func fetchData() {
        APIManager.shared.APIcall(endPoint: .getJobList){ [weak self] (response: Result<JobResponse?, NetworkErrors>)in
            guard let self = self else {
                return
            }
            switch response {
            case .success(let result):
                DispatchQueue.main.async {
                    if let jobs = result?.jobs {
                        self.jobArray = jobs
                    }
                    print("Success")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alertValue.toggle()
                    print("Failure", error)
                }
            }
        }
    }
    
    /// Function to perform post Method.
    func postJobs() {
        let encodedData = try? JSONEncoder().encode(postDataInstance)
        APIManager.shared.APIcall(body: encodedData, endPoint: .postJob) { [weak self] (response:Result<JobResponse?, NetworkErrors>) in
            guard self != nil else {
                return
            }
            switch response {
            case .success(_) :
                print("job submitted")
                break
            case .failure(let errorMessage):
                print("job submission failed with error: \(errorMessage)")
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
    /// - Parameter dateStringValue: <#dateStringValue description#>
    /// - Returns: <#description#>
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
    func isFavouriteButtonTapped(jobID:String?){
        if let uniqueJobId = jobID {
            let isFavourite = UserDefaults.standard.bool(forKey: uniqueJobId)
            UserDefaults.standard.set(!isFavourite, forKey: uniqueJobId)
        }
    }
    
    /// UpdateUI- updates the UI onclicking
    /// - Parameters:
    ///   - job: is of type job , is used to acess all the values in the API
    ///   - favouriteButtonImage: This will set the button image based on the value of the userdefaults.
    func updateUI(for job: Jobs, favouriteButtonImage: inout Image?) {
        let isFavourite = UserDefaults.standard.bool(forKey: job.id)
        favouriteButtonImage = isFavourite ? Image("heartButton") : Image("heart")
    }
}
