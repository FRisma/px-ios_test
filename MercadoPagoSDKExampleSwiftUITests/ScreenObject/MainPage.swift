//
//  MainScreen.swift
//  PXFlowUITests
//
//  Created by Demian Tejo on 12/3/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import XCTest

class MainScreen: BaseScreen {

    private lazy var checkoutButton = button("Start Checkout")
    private lazy var clearButton = button("Clear fields")
    private lazy var publicKeyField = textField("Public Key")
    private lazy var preferenceIdField = textField("Pref ID")
    private lazy var accessTokenField = textField("Access Token (Optional)")
    
    func tapCheckoutOption() -> MainGroupScreen {
        checkoutButton.tap()
        let mainGroupScreen = MainGroupScreen()
        return mainGroupScreen
    }

    func tapCheckoutOptionOnlyCard() -> CardScreen {
        checkoutButton.tap()
        return CardScreen()
    }

    func tapClearButton() -> MainScreen {
        clearButton.tap()
        return self
    }

    func fillPublicKey(_ text: String) -> MainScreen {
        publicKeyField.tap()
        publicKeyField.typeText(text)
        return self
    }

    func fillPreferenceId(_ text: String) -> MainScreen {
        preferenceIdField.tap()
        preferenceIdField.typeText(text)
        return self
    }

    func fillAccessToken(_ text: String) -> MainScreen {
        accessTokenField.tap()
        accessTokenField.typeText(text)
        return self
    }
    
    override func waitForElements() {
        waitFor(element: checkoutButton)
        waitFor(element: publicKeyField)
        waitFor(element: preferenceIdField)
        waitFor(element: accessTokenField)
    }

    
}