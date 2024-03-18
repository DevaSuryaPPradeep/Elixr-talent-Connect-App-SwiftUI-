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

struct Jobs :Codable,Identifiable {
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
}
