//
//  ViewInput.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation

protocol CryptoPriceViewInput: AnyObject {
    func updatePrice(_ price: String)
}
