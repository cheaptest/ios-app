import Foundation

protocol DataSource {
    func load(store: UserData)
    func save(data: UserData)
}

struct DataFromJSON: DataSource {

    let filePath: URL = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask)[0].appendingPathComponent("todos.json")

    func load(store: UserData) {
        if FileManager.default.fileExists(atPath: filePath.path) {
            print("data loaded: \(filePath.path)")
            let data = try! Data(contentsOf: filePath, options: .mappedIfSafe)
            let decoder = JSONDecoder()
            store.todos = try! decoder.decode([Todo].self, from: data)
        }
    }

    func save(data: UserData) {
        if let data = try? JSONEncoder().encode(data.todos) {
            try! data.write(to: filePath)
        }

    }

    typealias DataType = UserData

}
