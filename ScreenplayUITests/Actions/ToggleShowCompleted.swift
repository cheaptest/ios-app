import Foundation

struct ToggleShowCompleted: Actionable {
    func perform(_ state: inout AppState) {
        TodoListElements.showCompletedToggle(state).tap()
    }
}
