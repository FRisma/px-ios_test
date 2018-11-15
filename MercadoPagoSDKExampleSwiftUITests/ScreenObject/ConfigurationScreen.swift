//
//  ConfigurationScreen.swift
//  MercadoPagoSDKExampleSwiftUITests
//
//  Created by AUGUSTO COLLERONE ALFONSO on 11/7/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import UIKit

public class ConfigurationScreen: BaseScreen {

    private lazy var descuentoSwitch = switchElement("descuento_switch")
    private lazy var topeDeDescuentoSwitch = switchElement("tope_switch")
    private lazy var comisionesSwitch = switchElement("comisiones_switch")
    private lazy var accountMoneySwitch = switchElement("account_money_switch")
    private lazy var secondFactorSwitch = switchElement("second_factor_switch")
    private lazy var payerInfoSwitch = switchElement("payer_info_switch")
    private lazy var paymentPluginSwitch = switchElement("payment_plugin_switch")
    private lazy var discountNotAvailableSwitch = switchElement("discount_not_available_switch")
    private lazy var maxRedeemPerUserStepper = stepper("max_redeem_per_user_stepper")
    private lazy var applyConfigsButton = button("apply_configs_button")
    private lazy var pluginViewController = switchElement("view_controller_switch")

    func tapApplyConfigurationsButton() -> MainScreen {
        applyConfigsButton.tap()
        return MainScreen()
    }

    func changeDiscountSwitch() -> ConfigurationScreen {
        descuentoSwitch.tap()
        return self
    }

    func changeTopeDeDescuentoSwitch() -> ConfigurationScreen {
        topeDeDescuentoSwitch.tap()
        return self
    }

    func changeComisionesSwitch() -> ConfigurationScreen {
        comisionesSwitch.tap()
        return self
    }

    func changePaymentPluginSwitch() -> ConfigurationScreen {
        paymentPluginSwitch.tap()
        return self
    }

    func changeAccountMoneySwitch() -> ConfigurationScreen {
        accountMoneySwitch.tap()
        return self
    }
    
    func changeSecondFactorSwitch() -> ConfigurationScreen {
        secondFactorSwitch.tap()
        return self
    }

    func changePluginViewControllerSwitch() -> ConfigurationScreen {
        pluginViewController.tap()
        return self
    }

    func changePayerInfoSwitch() -> ConfigurationScreen {
        payerInfoSwitch.tap()
        return self
    }

    func incrementMaxRedeemPerUserStepperBy(_ int: Int) -> ConfigurationScreen {
        for _ in 1...int {
            maxRedeemPerUserStepper.buttons["Increment"].tap()
        }
        return self
    }

    func decrementMaxRedeemPerUserStepperBy(_ int: Int) -> ConfigurationScreen {
        for _ in 1...int {
            maxRedeemPerUserStepper.buttons["Decrement"].tap()
        }
        return self
    }

    func changeDiscountNotAvailableSwitch() -> ConfigurationScreen {
        discountNotAvailableSwitch.tap()
        return self
    }

    override open func waitForElements() {
        waitFor(element: descuentoSwitch)
   //     waitFor(element: topeDeDescuentoSwitch)
   //     waitFor(element: comisionesSwitch)
    //    waitFor(element: paymentPluginSwitch)
    //    waitFor(element: discountNotAvailableSwitch)
    //    waitFor(element: applyConfigsButton)
     //   waitFor(element: maxRedeemPerUserStepper)
    }
}
