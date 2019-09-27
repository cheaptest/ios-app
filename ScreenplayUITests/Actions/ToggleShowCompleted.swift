import Foundation

struct ToggleShowCompleted: Actionable {
    func perform(_ state: inout AppState) {

        // This doesn't work, and it's not my fault
        TodoListElements.showCompletedToggle(state).tap()

    }
}
