//
//  UserTokenAPI.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine

protocol UserTokenAPI {
    func fetchToken() -> AnyPublisher<UserToken, Error>
}
