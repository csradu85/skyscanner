//
//  UserToken.swift
//  SkyScanner
//
//  Created by cradu on 2026/01/21.
//

import Foundation

struct UserToken: Identifiable, Equatable {
    public let id: UUID
    public let token: String

    public init(id: UUID = UUID(), token: String) {
        self.id = id
        self.token = token
    }
}
