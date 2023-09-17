//
//  MockCryptoPriceViewInput.swift
//  CryptoCurrentTests
//
//  Created by Елена Русских on 2023-09-17.
//

import Foundation
@testable import CryptoCurrent

final class MockCryptoPriceViewInput: CryptoPriceViewInput {
  
    private(set) var displayedPrice: String?
    var displayedDirection: PriceChangeDirection?
    func display(price: String, changeDirection: PriceChangeDirection) {
        displayedPrice = price
        displayedDirection = changeDirection
    }
}
