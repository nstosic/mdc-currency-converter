//
//  SupportedCurrenciesResponse.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation

class SupportedCurrenciesResponse: BaseModel {
    let success: Bool
    let currencies: [String : String]
    
    private enum CodingKeys : String, CodingKey {
        case success
        case currencies
    }
    
    required init(success: Bool, currencies: [String : String]) {
        self.success = success
        self.currencies = currencies
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.currencies = try container.decode([String : String].self, forKey: .currencies)
        super.init()
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.currencies, forKey: .currencies)
    }
}
