import Foundation
import XCTest

struct SeeTodos: Validation {

    let todos: [String]
    init(_ todos: String...) {
        self.todos = todos
    }

    func perform(_ state: AppState) -> AppState {

        for todo in todos {
            print("checking: \(todo)")
            XCTAssertTrue(TodoListElements.todo(todo)(state).exists) 
        }

        return state
    }

    typealias StateType = AppState


}
