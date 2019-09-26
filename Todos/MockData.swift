import Foundation

public enum MockData: String {
    case basic
    case empty
}

extension MockData: DataSource {
    func load(store: UserData) {
        switch self {
        case .basic:
            store.todos = [
                Todo("buy milk"),
                Todo("buy chocolate", done: true)
            ]
        case .empty:
            store.todos = []
        }
    }

    func save(data: UserData) {
        // do nothing
    }


}
