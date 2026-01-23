//
//  HTTPClient.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine
import Foundation

protocol HTTPClient {
    func request<T: Decodable>(
        _ request: URLRequest,
        decoder: JSONDecoder
    ) -> AnyPublisher<T, Error>
}
