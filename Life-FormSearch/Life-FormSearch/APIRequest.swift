//
//  API.swift
//  Life-FormSearch
//
//  Created by Robert Steed on 1/29/23.
//

import Foundation
protocol APIRequest {
    
    associatedtype Response
    
    var urlRequest: URLRequest { get }
    
    func decodeResponse(data: Data) throws -> Response
}

enum APIRequestError: Error {
    case itemNotFound
}
