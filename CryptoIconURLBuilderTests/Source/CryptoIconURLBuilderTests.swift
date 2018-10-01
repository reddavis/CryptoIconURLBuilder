//
//  CryptoIconURLBuilderTests.swift
//  CryptoIconURLBuilderTests
//
//  Created by Red Davis on 26/08/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import XCTest
@testable import CryptoIconURLBuilder


internal final class CryptoIconURLBuilderTests: XCTestCase
{
    // MARK: Setup
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: -
    
    internal func testBuildingURL()
    {
        var expectation = URL(string: "https://cryptoicons.org/api/black/btc/30")!
        var builder = CryptoIconURLBuilder(style: .black, code: "btc", size: 30)
        XCTAssertEqual(builder.url, expectation)
        
        expectation = URL(string: "https://cryptoicons.org/api/color/eth/15")!
        builder = CryptoIconURLBuilder(style: .color, code: "eth", size: 15)
        XCTAssertEqual(builder.url, expectation)
        
        expectation = URL(string: "https://cryptoicons.org/api/icon/eth/15")!
        builder = CryptoIconURLBuilder(style: .icon, code: "eth", size: 15)
        XCTAssertEqual(builder.url, expectation)
        
        expectation = URL(string: "https://cryptoicons.org/api/white/eth/15")!
        builder = CryptoIconURLBuilder(style: .white, code: "eth", size: 15)
        XCTAssertEqual(builder.url, expectation)
        
        expectation = URL(string: "https://cryptoicons.org/api/white/eth/15")!
        builder = CryptoIconURLBuilder(style: .white, code: "ETH", size: 15)
        XCTAssertEqual(builder.url, expectation)
        
        expectation = URL(string: "https://cryptoicons.org/api/white/eth/15/ff00ff")!
        let color = Color(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0)
        builder = CryptoIconURLBuilder(style: .color, code: "ETH", size: 15, color: color)
        XCTAssertEqual(builder.url, expectation)
    }
}
