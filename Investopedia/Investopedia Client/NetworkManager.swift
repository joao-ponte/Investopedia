//
//  NetworkManager.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<ResponseType: Decodable>(
        _ endpoint: APIEndpoint,
        responseType: ResponseType.Type,
        completion: @escaping (Result<ResponseType, NetworkError>) -> Void
    )
}

class NetworkManager: NetworkManagerProtocol {
    func request<ResponseType: Decodable>(
        _ endpoint: APIEndpoint,
        responseType: ResponseType.Type,
        completion: @escaping (Result<ResponseType, NetworkError>) -> Void
    ) {
        guard let url = URL(string: endpoint.urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(.serviceError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}
