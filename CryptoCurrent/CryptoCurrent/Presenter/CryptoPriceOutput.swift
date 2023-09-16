//
//  CryptoPriceOutput.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import Foundation

protocol CryptoPriceOutput: AnyObject {
    func disconnect()
    func connectWebSocket()
}
