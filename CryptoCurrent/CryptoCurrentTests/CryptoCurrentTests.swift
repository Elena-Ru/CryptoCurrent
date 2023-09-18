//
//  CryptoCurrentTests.swift
//  CryptoCurrentTests
//
//  Created by Елена Русских on 2023-09-16.
//

import XCTest
@testable import CryptoCurrent

final class CryptoPricePresenterTests: XCTestCase {

    private var sut: CryptoPricePresenter!
    private var mockView: MockCryptoPriceViewInput!
    private var mockWebSocketService: MockWebSocketService!

    override func setUp() {
        super.setUp()
        mockView = MockCryptoPriceViewInput()
        mockWebSocketService = MockWebSocketService(webSocketURL: URL(string: "wss://example.com")!)
        sut = CryptoPricePresenter(view: mockView, webSocketURL: URL(string: "wss://example.com")!)
        sut.webSocketService = mockWebSocketService
    }

    func testConnectWebSocket() {
        sut.connectWebSocket()
        XCTAssertTrue(mockWebSocketService.isConnected)
    }

    func testDisconnectWebSocket() {
        sut.disconnect()
        XCTAssertFalse(mockWebSocketService.isConnected)
    }

    func testDidReceiveInvalidPriceData() {
        mockWebSocketService.mockReceivedMessage(message: "{\"invalidKey\":\"1234.56\"}")
        XCTAssertNil(mockView.displayedPrice)
    }
}
