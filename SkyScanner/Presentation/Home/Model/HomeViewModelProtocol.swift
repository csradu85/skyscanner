//
//  UserTokenModel.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Combine

protocol HomeViewModelProtocol {
    var token: AnyPublisher<UserToken?, Never> { get }
    func onAppear()
}
