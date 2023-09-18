//
//  ViewController.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import UIKit

class ViewController: UIViewController {
    
    private var rootView = RootView()
    var presenter: CryptoPriceOutput!
    
    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.connectWebSocket()
    }
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = UIColor(named: "background")
    }
    
    deinit {
        presenter.disconnect()
    }
}

extension ViewController: CryptoPriceViewInput {
    func display(price: String, changeDirection: PriceChangeDirection) {
        DispatchQueue.main.async {
            self.rootView.priceLabel.text = price
            switch changeDirection {
            case .increase:
                self.rootView.priceLabel.textColor = .green
            case .decrease:
                self.rootView.priceLabel.textColor = .red
            case .neutral:
                self.rootView.priceLabel.textColor = UIColor(named: "golden")
            }
        }
    }
}

