//
//  OneTapScreen.swift
//  MercadoPagoSDKExampleSwiftUITests
//
//  Created by Demian Tejo on 13/11/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import XCTest

class OneTapScreen: BaseScreen {

    private lazy var payButton = button("Pagar")
    
    override open func waitForElements() {
        waitFor(element: payButton)
    }
    
    private var cardCarrousel : XCUIElement {
        get {
            return element("card_carrousel")
        }
    }
    private var  installmentButton : XCUIElement {
        get {
            return element("installment_button")
        }
    }
    private var currentCard : XCUIElement {
        get {
            return element("action_card")
        }
    }
    
    func tapPayButtonForAnyCongrats() -> CongratsScreen {
        payButton.tap()
        return CongratsScreen()
    }
    
}
