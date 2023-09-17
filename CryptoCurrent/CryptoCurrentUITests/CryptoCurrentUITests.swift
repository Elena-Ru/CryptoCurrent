//
//  CryptoCurrentUITests.swift
//  CryptoCurrentUITests
//
//  Created by Елена Русских on 2023-09-16.
//

import XCTest

final class CryptoCurrentUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testTitleLabelExists() {
        let titleLabel = app.staticTexts["title"]
        XCTAssertTrue(titleLabel.exists, "Title label is not displayed on the main screen")
    }
  
    func testDescriptionLabelExists() {
        let descriptionLabel = app.staticTexts["description"]
        XCTAssertTrue(descriptionLabel.exists, "Description label is not displayed on the main screen")
    }
  
    func testBTCIconExists() {
        let btcIcon = app.images["icon"]
        XCTAssertTrue(btcIcon.exists, "BTC icon is not displayed on the main screen")
    }
    
    func testPriceLabelExists() {
        let priceLabel = app.staticTexts["price"]
        let predicate = NSPredicate(format: "exists == 1")
        let expectationForPriceLabel = expectation(for: predicate, evaluatedWith: priceLabel, handler: nil)
    
        let result = XCTWaiter.wait(for: [expectationForPriceLabel], timeout: 2)
    
        switch result {
        case .completed:
            XCTAssertTrue(priceLabel.exists, "Price label is not displayed on the main screen")
        default:
            XCTFail("The price label did not appear within 10 seconds.")
        }
    }
}
