import Foundation

struct TodoEditorElements {

    static var title: ElementLocator = {
        $0.app.tables.textFields["title"]
    }

    static var clearButton: ElementLocator = {
        $0.app.tables.buttons["clearTitle"]
    }

    static var saveButton: ElementLocator = {
        $0.app.tables.buttons["Save"]
    }

    static var deadlineToggle: ElementLocator = {
        $0.app.tables.switches["withDeadlineToggle"]
    }

    static var deadlineButton: ElementLocator = {
        $0.app.tables.buttons["DEADLINE"]
    }

    static var deadlineDatePickerYear: ElementLocator = {
        $0.app.tables.datePickers["DEADLINE"].pickerWheels.element(boundBy: 2)
    }
    static var deadlineDatePickerMonth: ElementLocator = {
        $0.app.tables.datePickers["DEADLINE"].pickerWheels.element(boundBy: 0)
    }
    static var deadlineDatePickerDay: ElementLocator = {
        $0.app.tables.datePickers["DEADLINE"].pickerWheels.element(boundBy: 1)
    }

}
