//
//  NetworkManger.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 30/03/24.
//

import Foundation

final class  NetworkManger :Codable{
    
    static let shared = NetworkManger()
    
    private init() {}
    
    func APICaller <T:Codable>(from endpoint:endPoints,body : Data? = nil, completion :@escaping(Result<T,networkErrors>)->Void) {
        
        guard let url = URL(string: baseURL.url.rawValue + endpoint.URLString) else {
            completion(.failure(networkErrors.badURL))
            print("error--->\(networkErrors.badURL)")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.methods.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/x-form-urlencoded", forHTTPHeaderField: "Content-type")
        switch endpoint.methods {
        case .GET:
            break
        case .POST :
            if let body = body {
                urlRequest.httpBody = body
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        case .DELETE:
            break
        }
        URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            if error != nil {
                completion(.failure(networkErrors.inValidError))
                print("error:\(networkErrors.inValidError))")
            }
            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode)
            else{
              return  completion(.failure(networkErrors.badResponse))
            }
            if let safeData = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: safeData)
                    completion(.success(decodedData))
                }
                catch {
                    completion(.failure(networkErrors.failedtoDecodeResponse))
                }
            }
        }
        .resume()
    }
}

