//
//  PayerInfoScreen.swift
//  MercadoPagoSDKExampleSwiftUITests
//
//  Created by Marcelo Oscar José on 23/10/2018.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import XCTest

public class PayerInfoScreen: BaseScreen {

    private lazy var payerBoletoComponent = element("DADOS PARA VALIDAR O SEU PAGAMENTO")
    private lazy var numberTextField = textField("Número")
    private lazy var nameTextField = textField("Nombre")
    private lazy var lastNameTextField = textField("Apellido")
    private lazy var continueButton = toolbarButton("Continuar")
    private lazy var backButton = getBackButton()

    override open func waitForElements() {
        waitFor(element: payerBoletoComponent)
    }

    func completeNumberAndContinueToPayer(_ text: String) -> PayerInfoScreen {
        numberTextField.typeText(text)
        continueButton.tap()
        return PayerInfoScreen()
    }

    func completeNameAndContinueToPayer(_ text: String) -> PayerInfoScreen {
        nameTextField.typeText(text)
        continueButton.tap()
        return PayerInfoScreen()
    }

    func completeLastNameAndContinueToReview(_ text: String) -> ReviewScreen {
        lastNameTextField.typeText(text)
        continueButton.tap()
        return ReviewScreen()
    }
}
