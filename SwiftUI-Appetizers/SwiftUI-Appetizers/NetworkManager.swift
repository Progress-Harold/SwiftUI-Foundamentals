//
//  NetworkManager.swift
//  SwiftUI-Appetizers
//
//  Created by Lee Davis on 8/13/21.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completion: @escaping(Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error  {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { // 404 etc
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                
                completion(.success(decodedResponse.request))
            }
            catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
