//
//  Currency.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation

class Currency: BaseModel, Equatable {
    let isoCode: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case isoCode
        case name
    }
    
    required init(isoCode: String, name: String) {
        self.isoCode = isoCode
        self.name = name
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isoCode = try container.decode(String.self, forKey: .isoCode)
        self.name = try container.decode(String.self, forKey: .name)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.isoCode, forKey: .isoCode)
        try container.encode(self.name, forKey: .name)
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.isoCode == rhs.isoCode
    }
}
