//
//  EndPointType.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//

import Foundation

/// Network errors
enum NetworkErrors :Error {
    case invaidURL
    case invalidStatusCode
    case invalidResponse
    case invalidData
    case invalidError
    case custom(String)
}

/// baseURL
enum baseURl :String {
case url = "http://localhost:9001/elixr"
}
/// HTTP methods.
enum HTTPMethod: String {
    case GET, POST, DELETE
}

/// Endpoints
enum EndPoints {
    case getJobList
    case postJob
    
    var urlString: String {
        switch self {
        case .getJobList:
            return "/jobs"
        case .postJob:
            return "/postjob"
        }
    }
    
    /// Endpoints wit HTTP METHODS.
    var method: HTTPMethod {
        switch self {
        case .getJobList:
            return .GET
        case .postJob:
            return .POST
        }
    }
}
