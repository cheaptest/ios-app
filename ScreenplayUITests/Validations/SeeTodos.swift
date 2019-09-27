import Foundation
import XCTest

struct SeeTodos: Verifiable {

    let todos: [String]
    init(_ todos: String...) {
        self.todos = todos
    }

    func perform(_ state: inout AppState) {

        for todo in todos {
            print("checking: \(todo)")
            XCTAssertTrue(TodoListElements.todo(todo)(state).exists)
        }

    }

    typealias StateType = AppState


}
