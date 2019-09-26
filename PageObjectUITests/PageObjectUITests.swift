import XCTest

class PageObjectUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testWithPageObject() {
        app.todoListView.addTodo(content: "Buy more milk")
    }

}
