//
//  CryptoPricePresenter.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//


import Foundation

class CryptoPricePresenter: CryptoPriceOutput {
    weak var view: CryptoPriceViewInput?
    var webSocketService: WebSocketService
    private var previousPrice: Double?

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
      guard let currentPrice = Double(price) else {
          view?.display(price: price, changeDirection: .neutral)
          return
      }
      
      var changeDirection: PriceChangeDirection?
      if let previous = previousPrice {
          if currentPrice > previous {
              changeDirection = .increase
          } else if currentPrice < previous {
              changeDirection = .decrease
          } else {
              changeDirection = .neutral
          }
      }
      
      view?.display(price: price, changeDirection: changeDirection ?? .neutral)
      previousPrice = currentPrice
  }

}

extension CryptoPricePresenter: WebSocketServiceDelegate {
    func didReceiveMessage(_ message: String) {
        handleSocketMessage(message)
    }

    func didFailWith(error: Error) {
    }
}
