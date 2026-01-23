//
//  HomeViewModel.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//
import Combine

final class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    
    private let userTokenUseCase: FetchUserTokenUserTokenUseCase
    private let userTokenSubject = CurrentValueSubject<UserToken?, Never>(nil)
    private var cancellables = Set<AnyCancellable>()
    
    // Expose the publisher required by the protocol
    var token: AnyPublisher<UserToken?, Never> {
        userTokenSubject.eraseToAnyPublisher()
    }
    
    // Add a published string for SwiftUI display
    @Published var tokenText: String = ""
    
    init(userTokenUseCase: FetchUserTokenUserTokenUseCase) {
        self.userTokenUseCase = userTokenUseCase
    }
    
    func onAppear() {
        userTokenUseCase.execute()
            .map { Optional.some($0) }             // success -> optional
            .catch { _ in Just<UserToken?>(nil) }  // error -> nil
            .sink { [weak self] token in
                self?.userTokenSubject.send(token)
                self?.tokenText = token?.token ?? "No token"
            }
            .store(in: &cancellables)
    }
}

