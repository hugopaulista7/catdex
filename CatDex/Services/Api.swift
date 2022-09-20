//
//  Api.swift
//  CatDex
//
//  Created by Hugo Paulista on 17/09/22.
//

import Foundation


enum ApiCallError: Error{
    case invalidURL
    case missingData
}

class Api {
    
    let BASE_PATH = "https://api.thecatapi.com/v1/"
    
    func callApi(_ path: String, completion: @escaping (Result<Data?, Error>) -> Void ) {
        guard let url = URL(string: BASE_PATH + path) else {
            completion(.failure(ApiCallError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiCallError.missingData))
                return
            }
            
            completion(.success(data))
            
        }.resume()
        
    }
}
