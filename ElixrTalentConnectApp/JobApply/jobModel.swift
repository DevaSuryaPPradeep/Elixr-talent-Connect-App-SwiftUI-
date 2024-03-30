//
//  jobModel.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 18/03/24.
//

import Foundation


struct UserDetails :Codable {
    let fulllname :String
    let email :URL?
    let phone :String
    let address :String
    let linkedInProfile :URL?
    let gitHubProfile :URL?
}

struct Education :Codable {
    let degree :String
    let school :String
    let graduation_year :Int
}

struct Experience :Codable {
    let position :String
    let company :String
    let start_date :String
    let end_date :String
    let responsibilities : [String]
}

struct Skills :Codable {
    let programming_languages :[String]
    let web_development :[String]
    let databases :[String]
}

struct Projects :Codable {
    let title :String
    let description :String
    let technologies_used :[String]
}

struct Certifications :Codable {
    let title :String
    let issued_by :String
    let date :String
}

struct References :Codable {
    let name :String
    let position :String
    let company :String
    let email : URL?
    let phone :String
}

struct PostData :Codable {
    let personaInfo :UserDetails
    let education :[Education]
    var experience :[Experience]
    let  skillSet :Skills
    let  projects :[Projects]
    let certifications :[Certifications]
    let reference : [References]
}


let demoUserDetails = UserDetails(fulllname: "Dev", email:URL(string : "dev@gmail.com"), phone: "9495777202", address: "Veedu(H) Thrissur", linkedInProfile :URL(string:"dev@linkedin") , gitHubProfile: URL(string: "dev@gmail.com"))
let educationHistory = [Education(degree: "BCA", school: "Old School Trafford", graduation_year: 2023),Education(degree: "Mca", school: "Kottayum", graduation_year: 2024)]
let experienceValue = [Experience(position: "Hr", company: "Elixr", start_date: "2-03-23", end_date: "2-09-23", responsibilities: ["Training and Development","Employee relationShip" ,"Orgaininsing Payroll","Benefits Administrations"])]
let skillSetValues  = Skills(programming_languages: ["Java", "c", "Python" ,"R"], web_development: ["HTML", "CSS", "JavaScript"], databases: ["MySQL"])
let projectIdeas = [Projects(title: "S-meet", description: "School Administrations", technologies_used: ["Swift", "UIkit"])]
let certifications =  [ Certifications(title: "iOS app development certificate @ Udemy", issued_by: "Udemy", date: "22-8-2")]
let reference =  [References(name: "Shyam", position: "Developer", company: "TCS", email: URL(string : "dev@gmail.com"), phone: "9399876522")]
let postDataInstance = PostData(personaInfo: demoUserDetails, education: educationHistory, experience: experienceValue, skillSet: skillSetValues, projects: projectIdeas, certifications: certifications, reference: reference)
