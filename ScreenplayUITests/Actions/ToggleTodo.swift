import Foundation

struct ToggleTodo: Actionable {

    let text: String

    func perform(_ state: inout AppState) {
        TodoListElements.todo(text)(state).tap()
    }

}
