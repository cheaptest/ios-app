import SwiftUI
import Combine

final class Store: ObservableObject {

    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }

    @Published var showDones = false

    func save() {
        if let data = try? JSONEncoder().encode(todos) {
            try! data.write(to: Store.filePath)
        }
    }

    static var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos.json")

    static func load() -> Store {

        let store = Store()
        if FileManager.default.fileExists(atPath: Store.filePath.path) {
            let data = try! Data(contentsOf: Store.filePath, options: .mappedIfSafe)
            let decoder = JSONDecoder()
            store.todos = try! decoder.decode([Todo].self, from: data)
        }

        return store
    }


}