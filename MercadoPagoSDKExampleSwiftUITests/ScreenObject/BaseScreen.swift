//
//  BaseScreen.swift
//  PXFlowUITests
//
//  Created by Demian Tejo on 12/3/18.
//  Copyright © 2018 MercadoPago. All rights reserved.
//

import XCTest
import UIKit

public protocol BaseScreenProtocol {
    func waitForElements()
}

open class BaseScreen : BaseScreenProtocol {
    let TIME_OUT : Double = 10 // Seconds
    public init() {
        waitForElements()
    }

    func validate(validationAssets:((BaseScreen)->Void)) -> Self {
        validationAssets(self)
        return self
    }

    open func waitForElements() {
        fatalError("All Screens Must Override this Method")
    }

    func exist(element: XCUIElement) -> Bool{
        return element.exists
    }
}

// MARK: Loading screen helpers
public extension BaseScreen {
    func waitForExpectation(expectation:XCTestExpectation,
                            time: Double,
                            safe: Bool = false) {
        let result: XCTWaiter.Result =
            XCTWaiter().wait(for: [expectation],
                             timeout: time)
        if !safe && result != .completed {
            XCTFail("Condition was not satisfied during \(time) seconds")
        }
    }

    func waitFor(element: XCUIElement) {
        let exists = NSPredicate(format: "exists = 1")
        self.waitForExpectation(expectation: XCTNSPredicateExpectation(predicate: exists, object: element), time: TIME_OUT)
    }
}

// MARK: Take elements from screen
public extension BaseScreen {
    func findAll(_ type: XCUIElement.ElementType) -> XCUIElementQuery {
        return XCUIApplication().descendants(matching: type)
    }
    func cell(_ text: String) -> XCUIElement {
        return findAll(.cell).containing(.staticText, identifier: text).element
    }
    func textField(_ text: String) -> XCUIElement {
        return  XCUIApplication().textFields[text]
    }
    func toolbarButton(_ text: String) -> XCUIElement {
        return XCUIApplication().toolbars.buttons[text]
    }
    func cellNumber(_ row : Int)  -> XCUIElement{
        return  XCUIApplication().cells.allElementsBoundByIndex[row]
    }
    func cellButton(_ text: String) -> XCUIElement {
        return button(text)
    }
    func button(_ text: String) -> XCUIElement {
        return XCUIApplication().buttons[text].firstMatch
    }
    func switchElement(_ text: String) -> XCUIElement {
        return XCUIApplication().switches[text].firstMatch
    }
    func element(_ text: String) -> XCUIElement {
        return XCUIApplication().staticTexts[text].firstMatch
    }
    func otherElement(_ text: String) -> XCUIElement {
        return XCUIApplication().otherElements[text].firstMatch
    }
    func imageView(_ text: String) -> XCUIElement {
        return XCUIApplication().images[text].firstMatch
    }
    func getBackButton() -> XCUIElement {
        return XCUIApplication().navigationBars.buttons.element(boundBy: 0)
    }
    func stepper(_ text: String) -> XCUIElement {
        return XCUIApplication().steppers[text].firstMatch
    }
    func firstSecureTextField() -> XCUIElement {
        return XCUIApplication().secureTextFields.firstMatch
    }
}

// MARK: UI Controls
public extension BaseScreen {
    func swipeUp() {
        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementQuery = scrollViewsQuery.otherElements.firstMatch
        elementQuery.swipeUp()
    }

    func swipeDown() {
        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementQuery = scrollViewsQuery.otherElements.firstMatch
        elementQuery.swipeDown()
    }
    
    func swipeRight() {
        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementQuery = scrollViewsQuery.otherElements.firstMatch
        elementQuery.swipeRight()
    }
    
    func swipeLeft() {
        let scrollViewsQuery = XCUIApplication().scrollViews
        let elementQuery = scrollViewsQuery.otherElements.firstMatch
        elementQuery.swipeLeft()
    }
}
