import Foundation

struct TodoListElements {
    static func todo(_ text: String) -> ElementLocator {
        return { $0.app.tables.cells.otherElements.containing(.staticText, identifier: text).buttons["toggleButton"] }
    }

    static var showCompletedToggle: ElementLocator = { $0.app.tables.switches["showCompletedToggle"] }
}
