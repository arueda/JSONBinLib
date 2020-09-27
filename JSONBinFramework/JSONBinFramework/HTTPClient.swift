//
//  HTTPClient.swift
//  JSONBinFramework
//
//  Created by Angel Alberto Rueda Mejia on 9/26/20.
//

import Foundation

protocol HTTPClient: AnyObject {
    
    func get()
    func post(_ urlRequest: URLRequest)
    
}
