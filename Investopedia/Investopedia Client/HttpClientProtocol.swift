//
//  HttpClientProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

protocol HttpClientProtocol {
    
    func taskForGetRequest<ResponseType: Decodable>(url: URL,
                                                    response: ResponseType.Type,
                                                    completion: @escaping (ResponseType?, Error?) -> Void)
}
