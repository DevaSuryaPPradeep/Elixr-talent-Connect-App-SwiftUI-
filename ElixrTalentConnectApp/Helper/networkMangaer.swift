////
////  networkManger.swift
////  ElixrTalentConnectApp
////
////  Created by Devasurya on 20/03/24.
////
//
//import Foundation
//
////final class APIManager :Codable{
////    /// Singleton implementation.
////    static let shared = APIManager()
////    private init() {}
//final class networkManager {
//    static let shared = networkManager()
//    private init () {}
//    
//    func APIcaller <H:Codable > (bodyPart :Data? = nil, endPointName:endPointType,completion:@escaping(Result<H,DataError>)->Void ) {
//        guard let url = URL(string:baseURl1.url.rawValue + endPointName.URlString) else{
//            completion(.failure(.invalidURL))
//            return
//        }
//        var URLValue = URLRequest(url: url)
//        URLValue.httpMethod = endPointName.methodType.rawValue
//        URLValue.setValue("application/json", forHTTPHeaderField: "Accept")
//        URLValue.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        switch endPointName.methodType {
//        case .GET:
//            break
//        case .POST:
//            if let body = bodyPart {
//                URLValue.httpBody = body
//                URLValue.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            }
//        case .DELETE:
//            break
//        }
//        URLSession.shared.dataTask(with: URLValue) {
//            data,response,error in
//            guard let error = error else{
//                completion(.failure(DataError.invalidError))
//                return
//            }
//            guard let responseValue = response as? HTTPURLResponse , (200...299).contains(responseValue.statusCode) else {
//                completion(.failure(DataError.invalidResponse))
//                return
//            }
//            if let data = data {
//                do{
//                    let responseData = try JSONDecoder().decode(H.self, from: data)
//                    completion(.success(responseData))
//                }
//                catch {
//                    completion(.failure(DataError.invalidResponse))
//                }
//            }
//        }
//        .resume()
//    }
//    enum baseURl1 :String{
//        case  url =  "http://localhost:9001/elixr"
//    }
//    
//    enum httpmethods :String {
//        case GET,POST,DELETE
//    }
//    
//    enum endPointType {
//        case getJobs
//        case postJobs
//        
//        var URlString:String {
//            switch self {
//            case .getJobs:
//                return "/jobs"
//            case .postJobs:
//                return "/postjobs"
//            }
//        }
//        
//        var methodType:httpmethods {
//            switch self {
//            case .getJobs:
//                return .GET
//            case .postJobs:
//                return .POST
//            }
//        }
//    }
//}
//enum DataError:Error{
//    case invalidURL
//    case invalidData
//    case invalidError
//    case invalidResponse
//    case invalidRequest
//    case invalidStatusCode
//    var stringValue:String {
//        switch self {
//        case .invalidURL:
//            return "API url is invalid"
//        case .invalidData:
//            return "data  is invalid"
//        case .invalidResponse:
//            return "invalidResponse pattern"
//        case .invalidRequest:
//            return " invalidRequest"
//        case .invalidStatusCode:
//            return " invalid Status code"
//        case .invalidError:
//            return "invalid Error"
//        }
//    }
//}
/////// Network errors
////enum NetworkErrors :Error {
////    case invaidURL
////    case invalidStatusCode
////    case invalidResponse
////    case invalidData
////    case invalidError
////    case custom(String)
////}
////
/////// baseURL
////enum baseURl :String {
////case url = "http://localhost:9001/elixr"
////}
//
////
/////// Endpoints
////enum EndPoints {
////    case getJobList
////    case postJob
////    
////    var urlString: String {
////        switch self {
////        case .getJobList:
////            return "/jobs"
////        case .postJob:
////            return "/postjob"
////        }
////    }
////    
////    /// Endpoints wit HTTP METHODS.
////    var method: HTTPMethod {
////        switch self {
////        case .getJobList:
////            return .GET
////        case .postJob:
////            return .POST
////        }
////    }
////}
