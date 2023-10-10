//
//  NetworkError.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case serviceError
    case noData
    case decodingError(DecodingError)
    case unknownError
    case httpStatus(Int)
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Bad URL"
        case .serviceError:
            return "Service error"
        case .noData:
            return "No data received"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknownError:
            return "Unknown error"
        case .httpStatus(let code):
            return "HTTP status code: \(code)"
        }
    }
}
