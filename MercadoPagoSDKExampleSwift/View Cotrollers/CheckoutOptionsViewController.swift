//
//  CheckoutOptionsViewController.swift
//  MercadoPagoSDKExampleSwift
//
//  Created by AUGUSTO COLLERONE ALFONSO on 19/4/18.
//  Copyright © 2018 Mercado Pago. All rights reserved.
//

import UIKit
import MercadoPagoSDKV4
import PXAccountMoneyPlugin

class CheckoutOptionsViewController: UIViewController, ConfigurationManager {

    var configurations: Configurations = Configurations(comisiones: false,descuento: false,tope: false,paymentPlugin: false, paymentPluginViewController : false, discountNotAvailable: false,maxRedeemPerUser: 0,accountMoney: false, secondFactor: false)
    
    var addCardFlow : AddCardFlow?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        //View
        self.title = "Checkout Configuration"
        self.view.backgroundColor = .white
        let topMargin = PXLayout.getSafeAreaTopInset() + 70

        //Public Key Input
        let publicKeyField: UITextField = createInputTextField(placeholder: "Public Key")
        PXLayout.centerHorizontally(view: publicKeyField).isActive = true
        PXLayout.pinTop(view: publicKeyField, withMargin: topMargin).isActive = true

        //Preference ID Input
        let preferenceIDField: UITextField = createInputTextField(placeholder: "Pref ID")
        PXLayout.put(view: preferenceIDField, onBottomOf: publicKeyField, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: preferenceIDField).isActive = true

        //Access Token Input
        let accessTokenField: UITextField = createInputTextField(placeholder: "Access Token (Optional)")
        PXLayout.put(view: accessTokenField, onBottomOf: preferenceIDField, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: accessTokenField).isActive = true

        //Card ID Input
        let cardIdField: UITextField = createInputTextField(placeholder: "Card Id (Optional)")
        cardIdField.autocapitalizationType = .none
        PXLayout.put(view: cardIdField, onBottomOf: accessTokenField, withMargin: PXLayout.S_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: cardIdField).isActive = true
        
        //Add card flow button
        
        let addCardFlowButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .gray
            button.setTitle("Start Card Flow", for: .normal)
            button.layer.cornerRadius = 20
            button.setTitleColor(.white, for: .normal)
            button.add(for: .touchUpInside, {
                if let accessToken = accessTokenField.text {
                    self.startAddCardFlow(accessToken: accessToken)
                }
            })
            return button
        }()
        self.view.addSubview(addCardFlowButton)
        PXLayout.put(view: addCardFlowButton, onBottomOf: cardIdField, withMargin: PXLayout.L_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: addCardFlowButton).isActive = true
        PXLayout.setHeight(owner: addCardFlowButton, height: 40).isActive = true
        PXLayout.setWidth(owner: addCardFlowButton, width: 200).isActive = true

        //Start Button
        let startButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .gray
            button.setTitle("Start Checkout", for: .normal)
            button.layer.cornerRadius = 20
            button.setTitleColor(.white, for: .normal)
            button.add(for: .touchUpInside, {
                if let publicKey = publicKeyField.text, let prefId = preferenceIDField.text {
                    self.startCheckout(publicKey: publicKey, prefId: prefId, accessToken: accessTokenField.text, cardId: cardIdField.text)
                }
            })
            return button
        }()
        self.view.addSubview(startButton)
        PXLayout.put(view: startButton, onBottomOf: addCardFlowButton, withMargin: PXLayout.L_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: startButton).isActive = true
        PXLayout.setHeight(owner: startButton, height: 40).isActive = true
        PXLayout.setWidth(owner: startButton, width: 200).isActive = true

        //Clear Fields Button
        let clearFieldsButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .red
            button.setTitle("Clear fields", for: .normal)
            button.layer.cornerRadius = 20
            button.setTitleColor(.white, for: .normal)
            button.add(for: .touchUpInside, {
                publicKeyField.text = ""
                preferenceIDField.text = ""
                accessTokenField.text = ""
            })
            return button
        }()
        self.view.addSubview(clearFieldsButton)
        PXLayout.put(view: clearFieldsButton, onBottomOf: startButton, withMargin: PXLayout.M_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: clearFieldsButton).isActive = true
        PXLayout.setHeight(owner: clearFieldsButton, height: 40).isActive = true
        PXLayout.setWidth(owner: clearFieldsButton, width: 200).isActive = true

        //Clear Fields Button
        let additionalConfigButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .blue
            button.setTitle("Add Configutations", for: .normal)
            button.layer.cornerRadius = 20
            button.setTitleColor(.white, for: .normal)
            button.add(for: .touchUpInside, {
                self.additionalConfigs()
            })
            return button
        }()
        self.view.addSubview(additionalConfigButton)
        PXLayout.put(view: additionalConfigButton, onBottomOf: clearFieldsButton, withMargin: PXLayout.M_MARGIN).isActive = true
        PXLayout.centerHorizontally(view: additionalConfigButton).isActive = true
        PXLayout.setHeight(owner: additionalConfigButton, height: 40).isActive = true
        PXLayout.setWidth(owner: additionalConfigButton, width: 200).isActive = true

        publicKeyField.text = "TEST-4763b824-93d7-4ca2-a7f7-93539c3ee5bd"
        preferenceIDField.text = "242624092-2a26fccd-14dd-4456-9161-5f2c44532f1d"
        accessTokenField.text = "TEST-1458038826212807-062020-ff9273c67bc567320eae1a07d1c2d5b5-246046416"
    }

    func createInputTextField(placeholder: String? = nil) -> UITextField {
        let textField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.placeholder = placeholder
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.cornerRadius = 5
            return textField
        }()
        self.view.addSubview(textField)
        PXLayout.setHeight(owner: textField, height: 40).isActive = true
        PXLayout.matchWidth(ofView: textField, withPercentage: 80).isActive = true
        return textField
    }
    
    func additionalConfigs(){
        let vc = ConfigurationsViewController()
        vc.delegate = self
        vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.navigationController?.present(vc, animated: true, completion: nil)
    }

    func setConfigurations(configs: Configurations) {
        self.configurations = configs
    }
    
    //---- Configs
    
    func startCheckout(publicKey: String, prefId: String, accessToken: String? = nil, cardId: String? = nil) {
        var paymentPref: PXPaymentConfiguration? = nil
        var accountMoney = configurations.accountMoney
        if configurations.paymentPlugin || getComisions() != nil || getDiscountConfiguration() != nil || accountMoney {
            if configurations.paymentPluginViewController {
                paymentPref = PXPaymentConfiguration(paymentProcessor: PaymentPluginViewController())
            }else{
                paymentPref = PXPaymentConfiguration(paymentProcessor: PaymentPlugin())
            }
            if let discountConfig = getDiscountConfiguration() {
                _ = paymentPref!.setDiscountConfiguration(config:discountConfig)
            }
            if let comisiones = getComisions() {
                _ = paymentPref!.addChargeRules(charges: comisiones)
            }
            if accountMoney {
                var privateKey = accessToken
                if privateKey == nil || privateKey == "" {
                    if configurations.secondFactor {
                        privateKey = "APP_USR-1505-092515-a228f3d4c560fc073217187ce74bb043-145698489"
                    }else{
                        privateKey = "APP_USR-1505-092514-c93c525595748980b4c36c1a4bec9e41-207100706"
                    }
                }
                let accountMoneyPlugin = AccountMoneyPlugin(accessToken: privateKey!, language: PXLanguages.SPANISH.rawValue)
                paymentPref = paymentPref!.addPaymentMethodPlugin(plugin: accountMoneyPlugin)
                
            }
            
        }
        let builder =  getBuilder(publicKey: publicKey, prefId: prefId, accessToken:accessToken, cardId: cardId, paymentConfig: paymentPref)
        let advanceConfig = PXAdvancedConfiguration()
        advanceConfig.expressEnabled = true
        builder.setAdvancedConfiguration(config: advanceConfig)
        MercadoPagoCheckout.init(builder:builder).start(navigationController: self.navigationController!)
        
    }
    
    func startAddCardFlow(accessToken: String) {
        guard let navController = self.navigationController else {
            return
        }
        self.addCardFlow = AddCardFlow(accessToken: accessToken, locale: "es", navigationController: navController)
        self.addCardFlow?.start()
    }
    
    func getBuilder(publicKey: String, prefId: String, accessToken: String?,  cardId: String?, paymentConfig: PXPaymentConfiguration?) -> MercadoPagoCheckoutBuilder {
        var builder : MercadoPagoCheckoutBuilder
        
        if let payconf = paymentConfig {
            builder = MercadoPagoCheckoutBuilder(publicKey: publicKey, checkoutPreference: createPreference(prefId: prefId, cardId:cardId), paymentConfiguration: payconf)
            builder.setPrivateKey(key: accessToken!)
            //builder = MercadoPagoCheckoutBuilder(publicKey: publicKey, preferenceId: prefId, paymentConfiguration: payconf)
        } else {
            builder = MercadoPagoCheckoutBuilder(publicKey: publicKey, preferenceId: prefId)
        }
        builder.setLanguage("MLA")
        
       // guard let configs = configurations else {
       //     return builder
       // }
        if configurations.descuento && configurations.paymentPlugin {
            var maxCouponAmount: Double = 0
            if configurations.tope {
                maxCouponAmount = 10
            }
            
            let discount = PXDiscount(id: "12344", name: "Descuento de prueba", percentOff: 0, amountOff: 10, couponAmount: 10, currencyId: "ARS")
            let campaign = PXCampaign(id: 12344, code: "code", name: "Campaña de prueba", maxCouponAmount: maxCouponAmount)
            if let maxRedeemPerUser = Int(exactly: configurations.maxRedeemPerUser)  {
                campaign.maxRedeemPerUser = maxRedeemPerUser
            }
        }
            
        return builder
    }
    func applyConfigurations(checkout: MercadoPagoCheckout){
        if (configurations.comisiones) {
           // getComisions(checkout: checkout)
        }
        //applyDiscountConfigurations(checkout: checkout)
        //applyPaymentPluginConfigurations(checkout: checkout)
    }
    func createPreference(prefId: String, cardId: String? = nil) -> PXCheckoutPreference {

        if cardId != nil {
            let item = PXItem(title: "id", quantity: 1, unitPrice: 100)
            //(itemId: "id", title: "Item Test", quantity: 1, unitPrice: 1, description: "Item test description", currencyId: "$")
           // let paymentPreference = PXPaymentPreference()
           // paymentPreference.excludedPaymentTypeIds = ["atm", "ticket", "account_money"]
           // paymentPreference.cardId = cardId
            let checkoutPreference = PXCheckoutPreference(siteId: "MLA", payerEmail: "sadsd@asd.com", items: [item])
            //(items: [item], payer: PXPayer(email: "test@test.com"), paymentMethods: paymentPreference)
           // checkoutPreference.preferenceId = prefId
            checkoutPreference.setCardId(cardId: cardId!)
            return checkoutPreference
        }
        return PXCheckoutPreference(preferenceId: prefId)
        
        //return PXCheckoutPreference(preferenceId: prefId)
    }
}

//MARK: Configurations --
extension CheckoutOptionsViewController {

    func getComisions() ->  [PXPaymentTypeChargeRule]? {

        if !configurations.comisiones || !configurations.paymentPlugin{
            return nil
        }
        let comision = PXPaymentTypeChargeRule(paymentMethdodId: "credit_card", amountCharge: 10.0)
        var chargesArray = [PXPaymentTypeChargeRule]()
        chargesArray.append(comision)
        return chargesArray
    }

    func applyPaymentPluginConfigurations(checkout: MercadoPagoCheckout) {
        /*
        guard let configs = configurations else {
            return
        }
        if configs.paymentPlugin {
            let paymentPlugin = PaymentPluginViewController(nibName: nil, bundle: nil)
            checkout.setPaymentPlugin(paymentPlugin: paymentPlugin)
        }
 */
    }


}
//MARK: Configurations --
extension CheckoutOptionsViewController {
    
    func getDiscountConfiguration() -> PXDiscountConfiguration? {

         if configurations.descuento {
            var maxCouponAmount: Double = 0
            if configurations.tope {
                maxCouponAmount = 10
            }
         
            if configurations.discountNotAvailable {
                return PXDiscountConfiguration.initForNotAvailableDiscount()
            }
            let discount = PXDiscount(id: "12344", name: "Descuento de prueba", percentOff: 0, amountOff: 10, couponAmount: 10, currencyId: "ARS")
            let campaign = PXCampaign(id: 12344, code: "code", name: "Campaña de prueba", maxCouponAmount: maxCouponAmount)
            if let maxRedeemPerUser = Int(exactly: configurations.maxRedeemPerUser)  {
                campaign.maxRedeemPerUser = maxRedeemPerUser
            }
            return PXDiscountConfiguration(discount: discount, campaign: campaign)
         }
        //TODO
         //if configs.discountNotAvailable {
         //   checkout.discountNotAvailable()
        // }
        return nil
    }
}

class PaymentPlugin: NSObject, PXPaymentProcessor {
    func paymentProcessorViewController() -> UIViewController? {
        return nil
    }
 
    func support() -> Bool {
        return true
    }
    func didReceive(navigationHandler: PXPaymentProcessorNavigationHandler){
        navigationHandler.next()
    }
    func didReceive(checkoutStore: PXCheckoutStore){
        
    }
    func startPayment(checkoutStore: PXCheckoutStore, errorHandler: PXPaymentProcessorErrorHandler, successWithBusinessResult: @escaping ((PXBusinessResult) -> Void), successWithPaymentResult: @escaping  ((PXGenericPayment) -> Void)){
        
        successWithBusinessResult(PXBusinessResult(receiptId: "123", status: .APPROVED, title: "hola", subtitle: "nono", icon: nil, mainAction: nil, secondaryAction: nil, helpMessage: nil, showPaymentMethod: true, statementDescription: nil, imageUrl: nil, topCustomView: nil, bottomCustomView: nil, paymentStatus: "APPROVED", paymentStatusDetail: "OK"))
    }
    
}

class PaymentPluginViewController: NSObject, PXPaymentProcessor {
    var navigationHandler: PXPaymentProcessorNavigationHandler!
    let viewController = ExamplePaymentProcessorViewController()
    func paymentProcessorViewController() -> UIViewController? {
        return viewController
    }
    
    func support() -> Bool {
        return true
    }
    func didReceive(navigationHandler: PXPaymentProcessorNavigationHandler){
        self.navigationHandler = navigationHandler
        viewController.handler = navigationHandler
    }
    func didReceive(checkoutStore: PXCheckoutStore){
        
    }
    func startPayment(checkoutStore: PXCheckoutStore, errorHandler: PXPaymentProcessorErrorHandler, successWithBusinessResult: @escaping ((PXBusinessResult) -> Void), successWithPaymentResult: @escaping  ((PXGenericPayment) -> Void)){
        
        successWithBusinessResult(PXBusinessResult(receiptId: "123", status: .APPROVED, title: "hola", subtitle: "nono", icon: nil, mainAction: nil, secondaryAction: nil, helpMessage: nil, showPaymentMethod: true, statementDescription: nil, imageUrl: nil, topCustomView: nil, bottomCustomView: nil, paymentStatus: "APPROVED", paymentStatusDetail: "OK"))
    }
    
}
