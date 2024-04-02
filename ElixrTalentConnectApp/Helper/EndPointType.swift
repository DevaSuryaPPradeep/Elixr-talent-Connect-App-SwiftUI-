////
////  EndPointType.swift
////  ElixrTalentConnectApp
////
////  Created by Devasurya on 15/03/24.
////

//the URL For HTTP get method.
/// http://localhost:9001/elixr/jobs

//The URL for HTTP POST method.
/// http://localhost:9001/elixr/postJobs

///baseURL
enum baseURL :String {
    case url = "http://localhost:9001/elixr/"
}

/// Methods for each endpoints.
enum methods :String {
    case GET,POST, DELETE
}

/// Decalaration of each endpoints and asociated methods.
enum endPoints :String{
    case getJobs
    case postJobs
    
    /// String related to the specific endpoint
    var URLString :String {
        switch self {
        case .getJobs:
            return "jobs"
        case .postJobs:
            return "postJobs"
        }
    }
    
    /// Method related to the specific enfdpoint
    var methods :methods {
        switch self {
        case .getJobs:
                .GET
        case .postJobs:
                .POST
        }
    }
}

/// enum of probable network errors that will happen while API fetching.
enum networkErrors :Error {
    case  badURL
    case invalidRequest
    case badResponse
    case badStatus
    case failedtoDecodeResponse
    case inValidError
}
