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
}

