//
//  ApiService.swift
//  SwiftUIMobileTask
//
//  Created by Obinna Aguwa on 06/10/2022.
//

import Foundation
import Combine

class ApiService {
    static let shared = ApiService()
    var cancellables = Set<AnyCancellable>()
    
    public enum ApiError: Error {
        case error(_ errorString: String)
    }
    
   
    
    public func getJSON<T: Decodable>(urlString: String, completion: @escaping(Result<T, ApiError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid url", comment: ""))))
            return
        }
        
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        
       URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main)
            .sink { (taskCompletion) in
                switch taskCompletion {
                case .finished:
                    return
                case .failure(let decodingError):
                    completion(.failure(.error("Error: \(decodingError.localizedDescription)")))
                }
            } receiveValue: { (decodedData) in
                completion(.success(decodedData))
            }
            .store(in: &cancellables)

        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completion(.failure(.error("Error: \(error.localizedDescription)")))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.error(NSLocalizedString("Error: Data is corrupt.", comment: ""))))
//                return
//            }
//
//
////            let a = JSONSerialization.jsonObject(with: data, options: [])
//
//            let decoder = JSONDecoder()
//
////            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            do {
//                let decodedData = try decoder.decode(T.self, from: data)
//                completion(.success(decodedData))
//            } catch let decodingError {
//                completion(.failure(.error("Error: \(decodingError.localizedDescription)")))
//            }
//
//        }.resume()
    }
}
