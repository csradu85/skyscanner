//
//  URLSessionHTTPClient.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/22.
//

import Combine
import Foundation

final class HttpSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(_ request: URLRequest, decoder: JSONDecoder) -> AnyPublisher<T, Error> where T: Decodable {
        session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw URLError(.badServerResponse)
                    }
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw HTTPError(statusCode: httpResponse.statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

