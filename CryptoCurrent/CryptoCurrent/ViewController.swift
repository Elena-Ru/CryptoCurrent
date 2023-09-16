//
//  ViewController.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import UIKit

class ViewController: UIViewController, URLSessionWebSocketDelegate {
  
  @IBOutlet weak var priceLabel: UILabel!
  
  private var webSocketTask: URLSessionWebSocketTask!
  private let url = URL(string: "wss://stream.binance.com:9443/ws/btcusdt@trade")!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    connectWebSocket()
  }
  
  func connectWebSocket() {
    let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
    webSocketTask = session.webSocketTask(with: url)
    webSocketTask.resume()
    receiveMessage()
  }
  
  func receiveMessage() {
    webSocketTask.receive { [weak self] result in
      switch result {
      case .failure(let error):
        print("WebSocket receiving error: \(error)")
      case .success(let message):
        switch message {
        case .string(let text):
          self?.handleSocketMessage(text)
        default:
          break
        }
        self?.receiveMessage()
      }
    }
  }
  
  func handleSocketMessage(_ message: String) {
    if let data = message.data(using: .utf8), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
      if let price = json["p"] as? String {
        DispatchQueue.main.async {
          self.priceLabel.text = price
        }
      }
    }
  }
  
  deinit {
    webSocketTask.cancel(with: .goingAway, reason: nil)
  }
}

