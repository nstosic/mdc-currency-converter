//
//  HomeTest.swift
//  Currency ConUITests
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import XCTest

class HomeTest: XCTestCase {
    
    var currentLanguage: (langCode: String, localeCode: String)? {
        let currentLocale = Locale(identifier: Locale.preferredLanguages.first!)
        guard let langCode = currentLocale.languageCode else {
            return nil
        }
        if langCode != "en" && langCode != "ja" {
            return ("en", "en-US")
        }
        var localeCode = langCode
        if let scriptCode = currentLocale.scriptCode {
            localeCode = "\(langCode)-\(scriptCode)"
        } else if let regionCode = currentLocale.regionCode {
            localeCode = "\(langCode)-\(regionCode)"
        }
        return (langCode, localeCode)
    }

    func localizedString(_ key: String) -> String {
        let testBundle = Bundle(for: HomeTest.self)
        if let currentLanguage = currentLanguage,
            let testBundlePath = testBundle.path(forResource: currentLanguage.localeCode, ofType: "lproj") ?? testBundle.path(forResource: currentLanguage.langCode, ofType: "lproj"),
            let localizedBundle = Bundle(path: testBundlePath)
        {
            return NSLocalizedString(key, bundle: localizedBundle, comment: "")
        }
        return "?"
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() throws {
        let title = XCUIApplication().navigationBars.staticTexts[Constants.appTitle]
        XCTAssert(title.exists)
        let lblSelectCurrency = XCUIApplication().staticTexts[localizedString("selectFromCurrency")]
        XCTAssert(lblSelectCurrency.exists)
        let lblQuotes = XCUIApplication().staticTexts[localizedString("quotes")]
        XCTAssert(lblQuotes.exists)
    }

    func testOnPickerSelectionChangedDataIsEventuallyFetched() throws {
        let expectQuotes = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: XCUIApplication().descendants(matching: .cell))
        
        // Simulate tapping on a different item
        let pickerView = XCUIApplication().pickerWheels.element
        pickerView.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.8)).tap()
        
        wait(for: [expectQuotes], timeout: 5)
    }
}
