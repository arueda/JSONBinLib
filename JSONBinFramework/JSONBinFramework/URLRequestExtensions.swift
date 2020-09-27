//
//  URLRequestExtensions.swift
//  JSONBinFramework
//
//  Created by Angel Alberto Rueda Mejia on 9/26/20.
//

import Foundation

extension URLRequest {
    
    mutating func setValue(_ value: ContentType, forHeader header: Header) {
        setValue(value.rawValue, forHTTPHeaderField: header.rawValue)
    }
    
    mutating func setValue(_ value: String, forHeader header: Header) {
        setValue(value, forHTTPHeaderField: header.rawValue)
    }
    
}
