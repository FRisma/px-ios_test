//
//  MainScreen.swift
//  PXFlowUITests
//
//  Created by Demian Tejo on 12/3/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import XCTest

public class MainScreen: BaseScreen {

    private lazy var checkoutButton = button("Start Checkout")
    private lazy var addCardButton = button("Start Card Flow")
    private lazy var clearButton = button("Clear fields")
    private lazy var configurationButton = button("Add Configutations")
    private lazy var publicKeyField = textField("Public Key")
    private lazy var preferenceIdField = textField("Pref ID")
    private lazy var accessTokenField = textField("Access Token (Optional)")
    private lazy var cardIdField = textField("Card Id (Optional)")

    func tapCheckoutOptionForOneTap() -> OneTapScreen {
        checkoutButton.tap()
        let onetapScreen = OneTapScreen()
        return onetapScreen
    }
    
    func tapCheckoutOption() -> MainGroupScreen {
        checkoutButton.tap()
        let mainGroupScreen = MainGroupScreen()
        return mainGroupScreen
    }

    func tapCheckoutOptionOnlyCard() -> CardScreen {
        checkoutButton.tap()
        return CardScreen()
    }

    func tapCheckoutOptionWithCardSelected() -> SecurityCodeScreen {
        checkoutButton.tap()
        return SecurityCodeScreen()
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

    func fillCardId(_ text: String) -> MainScreen {
        cardIdField.tap()
        cardIdField.typeText(text)
        return self
    }

    func tapConfigurationsButton() -> ConfigurationScreen {
        configurationButton.tap()
        return ConfigurationScreen()
    }
    
    func tapAddCardButton() -> CardScreen{
        addCardButton.tap()
        return CardScreen()
    }

    override open func waitForElements() {
        waitFor(element: checkoutButton)
      //  waitFor(element: configurationButton)
       // waitFor(element: publicKeyField)
       // waitFor(element: preferenceIdField)
       // waitFor(element: accessTokenField)
    }
}
