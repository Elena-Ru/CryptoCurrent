//
//  CryptoPricePresenter.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//


import Foundation

class CryptoPricePresenter: CryptoPriceOutput {
    weak var view: CryptoPriceViewInput?
    private let webSocketService: WebSocketService

    init(view: CryptoPriceViewInput, webSocketURL: URL) {
        self.view = view
        self.webSocketService = WebSocketService(webSocketURL: webSocketURL)
        self.webSocketService.delegate = self
    }

    func connectWebSocket() {
        webSocketService.connect()
    }

    func disconnect() {
        webSocketService.disconnect()
    }

    private func handleSocketMessage(_ message: String) {
        if let data = message.data(using: .utf8), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let price = json["p"] as? String {
                didReceivePriceData(price: price)
            }
        }
    }

    func didReceivePriceData(price: String) {
        view?.updatePrice(price)
    }
}

extension CryptoPricePresenter: WebSocketServiceDelegate {
    func didReceiveMessage(_ message: String) {
        handleSocketMessage(message)
    }

    func didFailWith(error: Error) {
    }
}
