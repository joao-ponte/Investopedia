//
//  FinancialTerm.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import Foundation

struct FinancialTerm: Decodable {
    let id: Int
    let word: String
    let meaning: String
    let example: String
}

struct ResponseData: Decodable {
    var dictionary: [FinancialTerm]
}
