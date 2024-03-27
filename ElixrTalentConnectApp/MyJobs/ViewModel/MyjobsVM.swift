//
//  MyjobsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation


class MyjobsVM :ObservableObject{
    
    @Published var dataSource :[Jobs] = []
    
    func getDataFromSafe() -> [Jobs]{
        guard   let savedArrayData =  UserDefaults.standard.data(forKey: .savedJobsID) else{
            return []
        }
        do{
            self.dataSource = try JSONDecoder().decode([Jobs].self, from: savedArrayData)
        }
        catch {
            print(error)
        }
        print("datasource---->\(dataSource)")
        return dataSource
    }
}
