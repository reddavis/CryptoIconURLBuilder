//
//  CryptoIconURLBuilder.swift
//  CryptoIconURLBuilder
//
//  Created by Red Davis on 26/08/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import Foundation


public struct CryptoIconURLBuilder
{
    // Public
    public let code: String
    public let style: Style
    public let size: Int
    public let url: URL
    
    // Private
    private let baseURL = URL(string: "https://cryptoicons.org")!
    
    // MARK: Initialization
    
    public init(style: Style, code: String, size: Int)
    {
        self.style = style
        self.code = code
        self.size = size
        self.url = self.baseURL.appendingPathComponent("api/\(style.rawValue)/\(code.lowercased())/\(size)")
    }
}


// MARK: Style

public extension CryptoIconURLBuilder
{
    public enum Style: String
    {
        case black, white, color, icon
    }
}
