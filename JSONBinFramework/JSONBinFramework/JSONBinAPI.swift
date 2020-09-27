//
//  JSONBinAPI.swift
//  JSONBinFramework
//
//  Created by Angel Alberto Rueda Mejia on 9/26/20.
//

import Foundation

typealias Closure = ([String: AnyObject]) -> Void

protocol JSONBinAPI  {
    
    var scheme: String { get }
    var host: String  { get }
    var path: String { get }
    
    var secretKey: String { get }
    
    
    func createBin(name: String,
                   privateBin: Bool,
                   collectionId: String?,
                   data: Data,
                   closure: @escaping (Result<Bool, Error>) -> Void)
    func readBin(id: String, closure: Closure )
    
}

