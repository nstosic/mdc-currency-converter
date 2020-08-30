//
//  BaseViewController.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewController {
    
}

extension BaseViewController {
    func displayError(title: String, message: String) {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: { (_) in
                navigationController.dismiss(animated: true, completion: nil)
            }))
            navigationController.present(alert, animated: true, completion: nil)
        }
    }
}
