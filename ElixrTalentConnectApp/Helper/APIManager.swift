////
////  ApiManager.swift
////  ElixrTalentConnectApp
////
////  Created by Devasurya on 15/03/24.
////A
//
//import Foundation
//
//
//final class APIManager :Codable{
//    /// Singleton implementation.
//    static let shared = APIManager()
//    private init() {}
//    
//    /// Function for API call.
//    /// - Parameters:
//    ///   - body: This is the data
//    ///   - endPoint: This describes about of the endpoints through which the http method is  decided.
//    ///   - completion: Escaping closure which have  two parts they are  the genric varible and networkerror enum to declare errors.
//    func APIcall <T:Codable> (body :Data? = nil,endPoint:EndPoints,completion:@escaping(Result<T,NetworkErrors>)->Void){
//        guard let url = URL(string: baseURl.url.rawValue + endPoint.urlString) else{
//            completion(.failure(NetworkErrors.invaidURL))
//            return
//        }
//        var URLValue = URLRequest(url: url)
//        URLValue.httpMethod = endPoint.method.rawValue
//        URLValue.setValue("application/json", forHTTPHeaderField: "Accept")
//        URLValue.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        
//        // This switch case will only work if the body part is requuired for the http method.
//        switch endPoint.method {
//        case .GET:
//            break
//        case .POST:
//            if let body = body {
//                URLValue.httpBody = body
//                URLValue.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            }
//        case .DELETE:
//            break
//        }
//        URLSession.shared.dataTask(with: URLValue) {data,response,error in
//            if error != nil{
//                completion(.failure(NetworkErrors.invalidError))
//                print("error:\(NetworkErrors.invalidError)")
//            }
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
//            else{
//                completion(.failure(NetworkErrors.invalidResponse))
//                //                print("error: \(NetworkErrors.invalidStatusCode)")
//                return
//            }
//            if let safeData = data {
//                do{
//                    let decodedData = try JSONDecoder().decode(T.self, from: safeData)
//                    completion(.success(decodedData))
//                }
//                catch {
//                    completion(.failure(NetworkErrors.custom("Invalid request")))
//                    print("Decoding error")
//                }
//            }
//        }
//        .resume()
//    }
//}
//
//
//
//
