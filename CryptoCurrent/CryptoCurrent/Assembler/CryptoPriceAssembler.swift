//
//  CryptoPriceAssembler.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation
import UIKit

class CryptoPriceAssembler {
    static func assembleModule() -> UIViewController {
        let view = ViewController()
        let presenter = CryptoPricePresenter(view: view, webSocketURL: view.webSocketURL)
        view.presenter = presenter

        return view
    }
}
