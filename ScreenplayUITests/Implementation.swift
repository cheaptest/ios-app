import Foundation
import XCTest

struct AppState: State {
    var app = XCUIApplication()
}

struct User: Actor {
    var state: AppState = AppState()

    typealias StateType = AppState

}

typealias ElementLocator = (AppState) -> XCUIElement
