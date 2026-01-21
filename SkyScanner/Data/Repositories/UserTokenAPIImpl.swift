//
//  UserTokenAPIImpl.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine

class UserTokenAPIImpl: UserTokenAPI {
    func fetchToken() -> AnyPublisher<UserToken, any Error> {
        Just(UserToken(token: "1234567890"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
