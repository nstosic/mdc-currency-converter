//
//  QuoteCell.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import UIKit

class QuoteCell: UITableViewCell {
    static let reuseIdentifier = "QuoteCell"
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    
    func setup(_ quote: Quote, multiplier: Double) {
        self.selectionStyle = .none
        lblCurrency.text = quote.to.isoCode
        let result = "\(quote.rate * multiplier)"
        guard let dotIndex = result.firstIndex(of: ".") else {
            lblRate.text = "\(result)"
            return
        }
        if result.distance(from: dotIndex, to: result.endIndex) > 3 {
            lblRate.text = String(result[..<result.index(dotIndex, offsetBy: 3)])
        } else {
            lblRate.text = "\(result)0"
        }
    }
}
