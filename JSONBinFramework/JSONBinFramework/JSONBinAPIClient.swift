//
//  JSONBinAPIClient.swift
//  JSONBinFramework
//
//  Created by Angel Alberto Rueda Mejia on 9/26/20.
//

import Foundation

typealias Value = String

enum ContentType: String {
    case aplicationJSON = "application/json"
}

enum Header: String {
    case contentType = "Content-Type"
    case secretKey = "secret-key"
    case collectionId = "collection-id"
    case `private` = "private"
    case name = "name"
}

public class JSONBinAPIClient {
    
    let scheme: String = "https"
    let host: String = "api.jsonbin.io"
    let path: String = "/b"
    
    let secretKey: String
    
    public init(secretKey: String) {
        self.secretKey = secretKey
    }
    
}

extension JSONBinAPIClient: HTTPClient {
    
    func get() { }
    
    func post(_ urlRequest: URLRequest) {
        let session = URLSession.shared
        session.configuration.waitsForConnectivity = true
        
        var request = urlRequest
        request.httpMethod = "Post"
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
            }
            
            if let data = data, let someValue = String(data: data,
                                                       encoding: .utf8) {
                print(someValue)
            }
            
        }
        
        dataTask.resume()
    }
    
}

extension JSONBinAPIClient: JSONBinAPI {
    
    private var getComponents: URLComponents {
        var components: URLComponents = .init()
        
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components
    }
    
    public func createBin(name: String,
                   privateBin: Bool,
                   collectionId: String?) {
        
        guard let url = getComponents.url else {
            print("unable to create url with given components")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(.aplicationJSON, forHeader: .contentType)
        request.setValue(secretKey, forHeader: .secretKey)
        request.setValue(name, forHeader: .name)
        request.setValue(privateBin.description, forHeader: .private)
        if let collectionId = collectionId {
            request.setValue(collectionId, forHeader: .collectionId)
        }
        request.httpBody = "{\"title\":\"hola\"}".data(using: .utf8)
        
        post(request)
    }
    
    func readBin(id: String, closure: Closure ) {
        
        get()
        
        closure([:])
        
    }
    
}
