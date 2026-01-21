//
//  UserTokenRepository.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine

protocol UserTokenRepository {
    func fetchToken() -> AnyPublisher<UserToken, Error>
}

