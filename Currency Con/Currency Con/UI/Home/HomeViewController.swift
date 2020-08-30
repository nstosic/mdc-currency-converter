//
//  ContentView.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import UIKit
import Resolver

class HomeViewController: UIViewController, BaseViewController {
    
    // View
    @IBOutlet weak var lblSelectCurrency: UILabel!
    @IBOutlet weak var pickerViewCurrencies: UIPickerView!
    @IBOutlet weak var activityIndicatorCurrencies: UIActivityIndicatorView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var textFieldAmount: UITextField!
    @IBOutlet weak var lblQuotes: UILabel!
    @IBOutlet weak var tableViewQuotes: UITableView!
    @IBOutlet weak var activityIndicatorQuotes: UIActivityIndicatorView!
    
    var amount: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap()
        title = Constants.appTitle
        lblSelectCurrency.text = NSLocalizedString("selectFromCurrency", comment: "")
        pickerViewCurrencies.dataSource = self
        pickerViewCurrencies.delegate = self
        activityIndicatorCurrencies.stopAnimating()
        lblAmount.text = NSLocalizedString("amount", comment: "")
        textFieldAmount.delegate = self
        textFieldAmount.placeholder = "1.00"
        textFieldAmount.keyboardType = .decimalPad
        textFieldAmount.returnKeyType = .done
        lblQuotes.text = NSLocalizedString("quotes", comment: "")
        tableViewQuotes.dataSource = self
        tableViewQuotes.delegate = self
        tableViewQuotes.register(UINib(nibName: "QuoteCell", bundle: nil), forCellReuseIdentifier: QuoteCell.reuseIdentifier)
        tableViewQuotes.separatorStyle = .none
        activityIndicatorQuotes.stopAnimating()
        loadCurrencies()
    }
    
    // Presentation
    @Injected var presenter: HomePresenter
    var currencies: [Currency]?
    var quotes: [Quote]?
    
    func loadCurrencies() {
        self.activityIndicatorCurrencies.startAnimating()
        presenter.loadCurrencies(success: { [unowned self] (currencies) in
            self.currencies = currencies.sorted(by: { (item1, item2) -> Bool in
                return item1.isoCode < item2.isoCode
            })
            self.pickerViewCurrencies.reloadAllComponents()
            self.activityIndicatorCurrencies.stopAnimating()
        }) { [unowned self] (error) in
            self.activityIndicatorCurrencies.stopAnimating()
            self.displayError(title: NSLocalizedString("error", comment: ""), message: NSLocalizedString("loadCurrenciesFailed", comment: ""))
        }
    }
    
    func loadQuotes(_ currency: Currency) {
        self.activityIndicatorQuotes.startAnimating()
        presenter.loadQuotes(currency, success: { [unowned self] (quotes) in
            self.quotes = quotes.sorted(by: { (item1, item2) -> Bool in
                return item1.to.isoCode < item2.to.isoCode
            })
            self.tableViewQuotes.reloadData()
            self.activityIndicatorQuotes.stopAnimating()
        }) { [unowned self] (error) in
            self.activityIndicatorQuotes.stopAnimating()
            self.displayError(title: NSLocalizedString("error", comment: ""), message: NSLocalizedString("loadQuotesFailed", comment: ""))
        }
    }
}

// Currency picker view
extension HomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let currencies = self.currencies else {
            return 0
        }
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies![row].isoCode
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.loadQuotes(currencies![row])
    }
}

// Quotes table view
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let quotes = self.quotes else {
            return 0
        }
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuoteCell.reuseIdentifier, for: indexPath) as! QuoteCell
        cell.setup(self.quotes![indexPath.row], multiplier: amount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
}

// Text field
extension HomeViewController: UITextFieldDelegate {
    @objc func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    func hideKeyboardOnTap() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:))))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }

        let newText = oldText.replacingCharacters(in: r, with: string)
        defer { updateAmount(newText) }
        if newText.isEmpty {
            return true
        }
        let predicate = try! NSRegularExpression(pattern: "^([0-9]+)(\\.([0-9]{0,2})?)?$")
        return predicate.numberOfMatches(in: newText, options: .reportProgress, range: NSMakeRange(0, newText.count)) > 0
    }
    
    func updateAmount(_ input: String) {
        if input.isEmpty || input == "." {
            self.amount = 1.0
        } else {
            self.amount = Double(input)!
        }
        tableViewQuotes.reloadData()
    }
}
