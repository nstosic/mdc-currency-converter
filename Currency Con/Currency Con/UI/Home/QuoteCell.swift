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
    
    func setup(_ quote: Quote) {
        self.selectionStyle = .none
        lblCurrency.text = quote.to.isoCode
        lblRate.text = "\(quote.rate)"
    }
}
