//
//  HomeViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation

class HomeViewModel:ObservableObject {
    @Published var alertValue :Bool = false
    @Published var jobArray :[Jobs] = []
    
    
    func fetchData()->(){
        APIManager.shared.getData(endPoint: .getJobs){ [weak self] (response:Result<JobResponse,NetworkErrors>) in
            guard let self = self
            else {
                return
            }
            switch response {
            case .success(let result) :
                DispatchQueue.main.async {
                    print("Succes result value-->\(result)")
          
                    self.jobArray = result.jobs
                    
                print("Success")
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.alertValue.toggle()
                    print("failure",NetworkErrors.custom("error"))
                }
                break
            }
        }
    }
}
