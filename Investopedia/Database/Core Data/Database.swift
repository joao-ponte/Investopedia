//
//  Database.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import Foundation

protocol Database {
    func fetchData(completion: @escaping ([CryptoCurrency]?) -> Void)
    func save()
}
