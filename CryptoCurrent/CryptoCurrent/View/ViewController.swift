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
        view.backgroundColor = .darkBackground

        presenter.connectWebSocket()
    }
    
    deinit {
        presenter.disconnect()
    }
}

extension ViewController: CryptoPriceViewInput {
    func updatePrice(_ price: String) {
        DispatchQueue.main.async {
          self.rootView.priceLabel.text = price
        }
    }
}
