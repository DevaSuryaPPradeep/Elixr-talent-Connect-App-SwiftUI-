//
//  jobViewModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 18/03/24.
//

import Foundation


class jobViewModel :ObservableObject {
    @Published var postJobs :[Jobs] = []
    
    func postData (){
        APIManager.shared.getData(postData: postDataInstance, endPoint: .postJobs) {[weak .self] (Response:Result<, NetworkErrors> in
            <#code#>
        }
    }
}
