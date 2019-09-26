import XCTest

protocol TodoListView {
    var addTaskButton: XCUIElement { get }
}

extension TodoListView {
    func addTodo(content: String) {
        addTaskButton.tap()
    }
}

extension XCUIApplication {
    var todoListView: TodoListView { return DefaultTodoListView() }
}

private struct DefaultTodoListView: TodoListView {

    var addTaskButton: XCUIElement { return XCUIApplication().navigationBars["Tasks"].buttons["Add Task"] }

    func todo(named name: String) -> XCUIElement? {
        return nil
    }
}
