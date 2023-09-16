//
//  ViewInput.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation
import UIKit

protocol CryptoPriceViewInput: AnyObject {
    func display(price: String, changeDirection: PriceChangeDirection)
}
