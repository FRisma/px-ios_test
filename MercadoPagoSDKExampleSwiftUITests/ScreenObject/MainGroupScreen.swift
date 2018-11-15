//
//  MainGroupScreen.swift
//  PXFlowUITests
//
//  Created by Demian Tejo on 12/3/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import XCTest

public class MainGroupScreen: BaseScreen {

    lazy var vaultView = element("¿Cómo quieres pagar?")
    lazy var cardButton = cell("Nueva tarjeta")
    lazy var cashButton = cell("Pago en efectivo")
    lazy var boletoButton = cell("Boleto Bancário")
    lazy var internetBoletoButton = cell("Internet Banking")
    lazy var floatingRow = element("floating_row_main_value_label")

    override open func waitForElements() {
        waitFor(element: vaultView)
    }

    func tapFloatingRowToDiscountDetail() -> DiscountDetailModalScreen {
        floatingRow.tap()
        return DiscountDetailModalScreen()
    }

    func tapFloatingRowToGroupsScreen() -> MainGroupScreen {
        floatingRow.tap()
        return self
    }

    func tapCardOption() -> CardsOptionsScreen {
        cardButton.tap()
        return CardsOptionsScreen()
    }

    func tapCashOption() -> CashOptionsScreen {
        cashButton.tap()
        return CashOptionsScreen()
    }

    func tapAccountMoneyOptionForSecondFactor() -> SecondFactorScreen {
        cellNumber(1).tap()
        return SecondFactorScreen()
    }

    func tapAccountMoneyOptionForReview() -> ReviewScreen {
        cellNumber(1).tap()
        return ReviewScreen()
    }

    func tapBoletoOption() -> MainGroupScreen {
        boletoButton.tap()
        return MainGroupScreen()
    }

    func tapBoletoInternetBanking() -> PayerInfoScreen {
        internetBoletoButton.tap()
        return PayerInfoScreen()
    }

    func tapBoletoInternetBankingForReview() -> ReviewScreen {
        internetBoletoButton.tap()
        return ReviewScreen()
    }
}

class CardsOptionsScreen: BaseScreen {
    private lazy var creditCardButton = cell("Nueva tarjeta de \ncrédito")
    private lazy var debitCardButton = cell("Nueva tarjeta de \ndébito")

    func tapCreditCardOption() -> CardScreen {
        creditCardButton.tap()
        return CardScreen()
    }

    func tapDebitCardOption() -> CardScreen {
        debitCardButton.tap()
        return CardScreen()
    }

    override func waitForElements() {
        waitFor(element: creditCardButton)
    }
}

class CashOptionsScreen: BaseScreen {
    private lazy var rapipagoButton = cell("Rapipago")

    func tapRapipagoOption() -> ReviewScreen {
        rapipagoButton.tap()
        return ReviewScreen()
    }

    override func waitForElements() {
        waitFor(element: rapipagoButton)
    }
}
