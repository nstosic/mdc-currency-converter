//
//  Quote.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation

class Quote: BaseModel, Equatable {
    let from: Currency
    let to: Currency
    let rate: Double
    
    private enum CodingKeys: String, CodingKey {
        case from
        case to
        case rate
    }
    
    required init(from: Currency, to: Currency, rate: Double) {
        self.from = from
        self.to = to
        self.rate = rate
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.from = try container.decode(Currency.self, forKey: .from)
        self.to = try container.decode(Currency.self, forKey: .to)
        self.rate = try container.decode(Double.self, forKey: .rate)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
        try container.encode(rate, forKey: .rate)
    }
    
    static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.from == rhs.from && lhs.to == rhs.to && lhs.rate == rhs.rate
    }
}
