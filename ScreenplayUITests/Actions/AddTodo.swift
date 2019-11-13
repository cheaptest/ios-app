import Foundation

struct AddTodo: Actionable {
    func perform(_ state: inout AppState) {
        TodoListElements.addNewTaskButton(state).tap()
        TodoEditorElements.title(state).tap()
        TodoEditorElements.clearButton(state).tap()
        TodoEditorElements.title(state).typeText(text)
        TodoEditorElements.saveButton(state).tap()
    }

    let text: String
}
