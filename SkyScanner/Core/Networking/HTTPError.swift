//
//  HTTPError.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/22.
//

import Foundation

public struct HTTPError: LocalizedError {
    public let statusCode: Int
    
    public var errorDescription: String? {
        "HTTP error with status code: \(statusCode)"
    }
    
}
