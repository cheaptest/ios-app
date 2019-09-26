import Foundation

struct TodoListElements {
    static func todo(_ text: String) -> ElementLocator {
        return { $0.app.tables.staticTexts[text] }
    }
}
