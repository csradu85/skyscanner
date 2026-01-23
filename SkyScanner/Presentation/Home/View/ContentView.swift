//
//  ContentView.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.tokenText)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    // Preview with a stubbed repository to satisfy dependencies
    let repo = UserTokenRepositoryStub()
    let useCase = FetchUserTokenUserTokenUseCase(repository: repo)
    let vm = HomeViewModel(userTokenUseCase: useCase)
    return ContentView(viewModel: vm)
}

// MARK: - Preview-only stub
private final class UserTokenRepositoryStub: UserTokenRepository {
    func fetchToken() -> AnyPublisher<UserToken, Error> {
        Just(UserToken(token: "preview-token"))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

