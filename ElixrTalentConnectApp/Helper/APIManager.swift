//
//  ApiManager.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 15/03/24.
//A

import Foundation
final class APIManager {
   // "http://localhost:9001/elixr/jobs"
    static let shared = APIManager()
    let baseURL :String = "http://localhost:9001/elixr"
    private init() {}
    
    
    
    func getData<T:Codable> (endPoint:EndPoints,completion:@escaping((Result<T,NetworkErrors>)->())){
      
        guard let urlRequest = getURLRequest(endpoint:endPoint)else{
            completion(.failure(NetworkErrors.invaidURL))
            return
        }
        URLSession.shared.dataTask(with: urlRequest)
        {
            (data, response, error) in
            if let error = error {
                completion(.failure(.custom(error.localizedDescription)))
                print("error block")
                return
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                print("invalidResponse")
                completion(.failure(.invalidResponse))
                return
            }
            let successStatusRange = 200...299
            guard successStatusRange.contains(urlResponse.statusCode) else {
                print("invalidStatusCode")
                completion(.failure(.invalidStatusCode))
                return
            }
            guard let myData = data else {
                print("invalidData")
                return completion(.failure(.invalidData))
            }
            do {
                print("myData--->\(String(data: myData, encoding: .utf8) ?? "Invalid Data")")
                let result:T =  try JSONDecoder().decode(T.self, from: myData)
                completion(.success(result))
                print("decodedData-->\(result)")
                return
            } catch {
                completion(.failure(.custom(error.localizedDescription)))
                print("\(error.localizedDescription)")
                return
            }
        }
        .resume()
    }
        
        func getURLRequest(endpoint:EndPoints) -> URLRequest? {
            let URLString = baseURL + endpoint.rawValue
            guard let url = URL(string: URLString) else {
                return nil
            }
            var URLValue =  URLRequest(url: url)
            URLValue.httpMethod = endpoint.httpMethod
            URLValue.setValue("application/json", forHTTPHeaderField: "Accept")
            URLValue.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            return URLValue
        }
        
    }

enum NetworkErrors :Error {
    case invaidURL
    case invalidStatusCode
    case invalidResponse
    case invalidData
    case invalidError
    case custom(String)
}



enum EndPoints: String {
    case getJobs = "/jobs"
      var httpMethod: String {
        switch self {
                case .getJobs:
            "GET"
        }
    }
}


