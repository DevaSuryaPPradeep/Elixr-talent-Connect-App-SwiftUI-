//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation

//@MainActor
/// Viewmodel for the home View.
class HomeViewModel:ObservableObject {
    
    /// Published properties
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    
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
    
    func dateFormatter(dateString:String?) ->String? {
        guard let dateString = dateString, let formatedString = formatHelper(dateStringValue: dateString) else{
            return nil
        }
        return formatedString
    }
    
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
                monthFormatter.dateFormat = "MM"
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
        ///date from the API - 2024-01-10
        /// expected output 2nd feb 2024, 1st feb 2024
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
        
    
}
