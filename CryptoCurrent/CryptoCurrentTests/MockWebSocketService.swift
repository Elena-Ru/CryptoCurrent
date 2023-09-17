//
//  MockWebSocketService.swift
//  CryptoCurrentTests
//
//  Created by Елена Русских on 2023-09-17.
//

import Foundation
@testable import CryptoCurrent

final class MockWebSocketService: WebSocketService {
    
    private(set) var isConnected = false
    override func connect() {
        isConnected = true
    }

    override func disconnect() {
        isConnected = false
    }

    func mockReceivedMessage(message: String) {
        delegate?.didReceiveMessage(message)
    }
}
