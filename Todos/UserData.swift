import SwiftUI
import Combine

final class UserData: ObservableObject {

    @Published var todos: [Todo] = [] {
        didSet {
            dataSource.save(data: self)
        }
    }
    @Published var showDones = false

    private let dataSource: DataSource

    init(_ dataSource: DataSource) {
        self.dataSource = dataSource
        dataSource.load(store: self)
    }

    func update(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = todo
        } else {
            todos.append(todo)
        }
    }

    func toggle(_ todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].done.toggle()
        }
    }

}
