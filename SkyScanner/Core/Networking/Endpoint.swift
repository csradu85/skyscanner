//
//  Endpoint.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/22.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: String { get }
    var headers: [String: String] { get }
}

extension Endpoint {
    func makeRequest(baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL.appendingPathComponent(path))
        request.httpMethod = method
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        return request
    }
}
