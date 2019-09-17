import Foundation

struct Todo: Identifiable, Codable {
    var id: String

    var text: String
    var done: Bool
    var deadline: Date?

    init(_ text: String, done: Bool = false, deadline: Date? = nil) {
        self.id = "\(Date())"
        self.text = text
        self.done = done
        self.deadline = deadline
    }
    
}

extension Todo {
    static var `default`: Todo {
        return Todo("Buy Milk")
    }
}
