import Foundation

struct AddTodo: Actionable {
    func perform(_ state: inout AppState) {
        TodoListElements.addNewTaskButton(state).tap()
        TodoEditorElements.title(state).tap()
        TodoEditorElements.clearButton(state).tap()
        TodoEditorElements.title(state).typeText(text)

        if let (month, day, year) = deadline {
            TodoEditorElements.deadlineToggle(state).tap()
            TodoEditorElements.deadlineButton(state).tap()
            TodoEditorElements.deadlineDatePickerYear(state).adjust(toPickerWheelValue: year)
            TodoEditorElements.deadlineDatePickerMonth(state).adjust(toPickerWheelValue: month)
            TodoEditorElements.deadlineDatePickerDay(state).adjust(toPickerWheelValue: day)
        }

        TodoEditorElements.saveButton(state).tap()
    }

    let text: String
    let deadline: (String, String, String)?
}
