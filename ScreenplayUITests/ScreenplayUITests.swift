import XCTest

class ScreenplayUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testWithScreenplay() {
        var user = User()
        user.does(HaveTodos.basic)
        user.perform(LaunchApp()
            + ToggleTodo(text: "buy milk")
            + ToggleShowCompleted())
        user.should(SeeTodos("buy milk", "buy chocolate"))
    }

    func testAddNewTask() {
        var user = User()
        user.does(HaveTodos.basic)
        user.perform(LaunchApp()
            + AddTodo(text: "Buy Coffee"))
        user.should(SeeTodos("buy milk", "Buy Coffee"))
    }

}
