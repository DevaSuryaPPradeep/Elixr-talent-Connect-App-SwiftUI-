//
//  jobDetailsVM.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 26/03/24.
//

import Foundation

class jobDetailsVm:ObservableObject{
   
    
    // MARK: - Functions to  perform Favourite Button action.
    func checkifValuePresent(wishListVariable: String?, isFavorite: Bool) {
         guard let uniqueJobId = wishListVariable else {
             return
         }
         UserDefaults.standard.set(isFavorite, forKey: uniqueJobId) // Use uniqueJobId as key
     }
     
     func actionOnCheck(wishListVariable: String?) -> Bool {
         guard let uniqueJobId = wishListVariable else {
             return false
         }
         return UserDefaults.standard.bool(forKey: uniqueJobId)
     }
}

