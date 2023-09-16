//
//  WebSocketService.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation

protocol WebSocketServiceDelegate: AnyObject {
    func didReceiveMessage(_ message: String)
    func didFailWith(error: Error)
}

class WebSocketService: NSObject, URLSessionWebSocketDelegate {
    private let webSocketURL: URL
    private var webSocketTask: URLSessionWebSocketTask!
    weak var delegate: WebSocketServiceDelegate?

    init(webSocketURL: URL) {
        self.webSocketURL = webSocketURL
    }

    func connect() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        webSocketTask = session.webSocketTask(with: webSocketURL)
        webSocketTask.resume()
        receiveMessage()
    }

    func disconnect() {
        webSocketTask.cancel(with: .goingAway, reason: nil)
    }

    private func receiveMessage() {
        webSocketTask.receive { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.didFailWith(error: error)
            case .success(let message):
                switch message {
                case .string(let text):
                    self?.delegate?.didReceiveMessage(text)
                default:
                    break
                }
                self?.receiveMessage()
            }
        }
    }
}

