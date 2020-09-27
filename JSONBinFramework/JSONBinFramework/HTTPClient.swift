//
//  HTTPClient.swift
//  JSONBinFramework
//
//  Created by Angel Alberto Rueda Mejia on 9/26/20.
//

import Foundation

enum JSONBinAPIError: Error {
    case error(Error)
    case noData
}

protocol HTTPClient: AnyObject {
    
    func get()
    func post(_ urlRequest: URLRequest,
              closure: @escaping (Result<Data, JSONBinAPIError>) -> Void)
    
}
