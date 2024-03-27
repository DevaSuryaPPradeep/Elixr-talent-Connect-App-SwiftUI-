//
//  HomeModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation


struct JobResponse :Codable {
    let jobs : [Jobs]
}

struct Jobs :Codable,Identifiable,Hashable {
    let id :String
    var title :String
    let department :String
    let postedDate : String
    let deadlineDate : String
    let description : String
    let responsibilities : String
    let requirements : String
    let location : String
    let salary : String
    let status : String
    var isFavouriteBool :Bool
    {
        get {
            UserDefaults.standard.bool(forKey: id)
        }
        set {
            let container = UserDefaults.standard.bool(forKey: id)
            UserDefaults.standard.setValue(!container, forKey: id)
        }
    }
}

