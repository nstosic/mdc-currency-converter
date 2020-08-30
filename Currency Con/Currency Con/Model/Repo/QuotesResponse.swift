//
//  QuotesResponse.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation

class QuotesResponse: BaseModel {
    let success: Bool
    let source: String
    let quotes: [String : Double]
    let timestamp: Int
    
    private enum CodingKeys: String, CodingKey {
        case success
        case source
        case quotes
        case timestamp
    }
    
    required init(success: Bool, source: String, quotes: [String : Double], timestamp: Int) {
        self.success = success
        self.source = source
        self.quotes = quotes
        self.timestamp = timestamp
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.source = try container.decode(String.self, forKey: .source)
        self.quotes = try container.decode([String : Double].self, forKey: .quotes)
        self.timestamp = try container.decode(Int.self, forKey: .timestamp)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.quotes, forKey: .quotes)
        try container.encode(self.timestamp, forKey: .timestamp)
    }
}
