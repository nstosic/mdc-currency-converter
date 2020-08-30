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
    @IBOutlet weak var lblQuotes: UILabel!
    @IBOutlet weak var tableViewQuotes: UITableView!
    @IBOutlet weak var activityIndicatorQuotes: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appTitle
        lblSelectCurrency.text = NSLocalizedString("selectFromCurrency", comment: "")
        pickerViewCurrencies.dataSource = self
        pickerViewCurrencies.delegate = self
        activityIndicatorCurrencies.stopAnimating()
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
            self.currencies = currencies
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
            self.quotes = quotes
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
        cell.setup(self.quotes![indexPath.row])
        return cell
    }
}
