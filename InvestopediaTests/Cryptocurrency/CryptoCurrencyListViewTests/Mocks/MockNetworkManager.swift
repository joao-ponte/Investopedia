//
//  MockNetworkManager.swift
//  InvestopediaTests
//
//  Created by João Ponte on 13/09/2023.
//

import Foundation
@testable import Investopedia

class MockNetworkManager: NetworkManagerProtocol {
    var mockResponse: Result<ResponseCryptos, Error> = .success(ResponseCryptos(data: []))

    func request<ResponseType: Decodable>(_ endpoint: APIEndpoint,
                                          responseType: ResponseType.Type,
                                          completion: @escaping (Result<ResponseType, NetworkError>) -> Void) {
        switch mockResponse {
        case .success(let response):
            if let typedResponse = response as? ResponseType {
                completion(.success(typedResponse))
            } else {
                let decodingError = DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Data decoding error"))
                completion(.failure(.decodingError(decodingError))) // Handle the error appropriately
            }
        case .failure(let error):
            completion(.failure(.unknownError)) // Handle the error appropriately
        }
    }
}
