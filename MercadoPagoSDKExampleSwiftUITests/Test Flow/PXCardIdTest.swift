//
//  PXCardIdTest.swift
//  MercadoPagoSDKExampleSwiftUITests
//
//  Created by Marcelo Oscar José on 09/08/2018.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import XCTest

class PXCardIdTest: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_nueva_tarjeta_debito() {
        let _ = MainScreen()
            .tapClearButton()
            .tapConfigurationsButton()
            .changePaymentPluginSwitch()
            .tapApplyConfigurationsButton()
            .fillPublicKey("APP_USR-04c0e3ac-d6f5-415a-8db1-5d555469d42e")
            .fillAccessToken("APP_USR-1505-080815-c6ea450de1bf828e39add499237d727f-312667294")
            .fillCardId("debit_card")
            .tapCheckoutOptionOnlyCard()
            .completeNumberAndContinue("6042 0130 7660 8231")
            .completeNameAndContinue("APRO")
            .completeExpirationDateAndContinue("1225")
            .completeCVVAndContinue("123")
            .completeNumberAndContinueToReview("30666777")
            .tapPayButtonForApproved()
    }

    func test_nueva_tarjeta_debito_rejected() {
        let _ = MainScreen()
            .tapClearButton()
            .tapConfigurationsButton()
            .changePaymentPluginSwitch()
            .tapApplyConfigurationsButton()
            .fillPublicKey("APP_USR-04c0e3ac-d6f5-415a-8db1-5d555469d42e")
            .fillAccessToken("APP_USR-1505-080815-c6ea450de1bf828e39add499237d727f-312667294")
            .fillCardId("debit_card")
            .tapCheckoutOptionOnlyCard()
            .completeNumberAndContinue("6042 0130 7660 8231")
            .completeNameAndContinue("OTHE")
            .completeExpirationDateAndContinue("1225")
            .completeCVVAndContinue("123")
            .completeNumberAndContinueToReview("30666777")
            .tapPayButtonForRejected()
    }

    func test_tarjeta_debito_guardada() {
        let _ = MainScreen()
            .tapClearButton()
            .tapConfigurationsButton()
            .changePaymentPluginSwitch()
            .tapApplyConfigurationsButton()
            .fillPublicKey("APP_USR-04c0e3ac-d6f5-415a-8db1-5d555469d42e")
            .fillAccessToken("APP_USR-1505-080815-c6ea450de1bf828e39add499237d727f-312667294")
            .fillCardId("260077840")
            .tapCheckoutOptionWithCardSelected()
            .completeCVVAndContinueToReview("123")
            .tapPayButtonForApproved()
    }
}
