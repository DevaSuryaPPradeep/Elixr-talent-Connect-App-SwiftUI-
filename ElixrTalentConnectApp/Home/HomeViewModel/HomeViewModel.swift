//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation

class HomeViewModel:ObservableObject {
    /// Published properties
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    
    //APIManager.shared.getData(endPoint: .getJobs){ [weak self] (response:Result<JobResponse,NetworkErrors>) in
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
                        print("Arraycount-->\(self.jobArray.count)")
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
            guard let self = self else {
                return
            }
            switch response {
                case .success(let result) :
                    print("job submitted")
                    break
                case .failure(let errorMessage):
                    print("job submission failed with error: \(errorMessage)")
                }

        }
    }
}
