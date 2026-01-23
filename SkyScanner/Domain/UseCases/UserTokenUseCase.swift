//
//  UserTokenUseCase.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine

protocol UserTokenUseCase {
    func execute() -> AnyPublisher<UserToken, Error>
}

final class FetchUserTokenUserTokenUseCase: UserTokenUseCase {
    private let repository: UserTokenRepository

    init(repository: UserTokenRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<UserToken, Error> {
        repository.fetchToken()
    }
}
