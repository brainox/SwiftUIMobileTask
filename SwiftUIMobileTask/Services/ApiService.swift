//
//  ApiService.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    public enum ApiError: Error {
        case error(_ errorString: String)
    }
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
    
    func fetchData(escaping: (() -> Void)?) {
        
    }
    
    public func getJSON<T: Decodable>(urlString: String, completion: @escaping(Result<T, ApiError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid url", comment: ""))))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("Error: \(error.localizedDescription)")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
                return
            }
            
           
//            let a = JSONSerialization.jsonObject(with: data, options: [])
            
            let decoder = JSONDecoder()
            
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let decodingError {
                completion(.failure(.error("Error: \(decodingError.localizedDescription)")))
            }

        }.resume()
    }
}
