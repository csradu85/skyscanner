//
//  SkyScannerApp.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import SwiftUI
import Combine

@main
struct SkyScannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: makeHomeViewModel())
        }
    }
    
    private func makeHomeViewModel() -> HomeViewModel {
        // Wire dependencies
        let api = UserTokenAPIImpl()
        let repository = UserTokenRepositoryAdapter(api: api)
        let useCase = FetchUserTokenUserTokenUseCase(repository: repository)
        return HomeViewModel(userTokenUseCase: useCase)
    }
}

// Minimal adapter to satisfy repository from the provided API
private final class UserTokenRepositoryAdapter: UserTokenRepository {
    private let api: UserTokenAPI
    init(api: UserTokenAPI) { self.api = api }
    func fetchToken() -> AnyPublisher<UserToken, Error> {
        api.fetchToken()
    }
}

