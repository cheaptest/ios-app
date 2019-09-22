import Foundation
import SwiftUI
import Combine

struct Todo: Identifiable, Codable {
    var id = UUID()

    var text: String
    var done: Bool
    var deadline: Date?

    init(_ text: String, done: Bool = false, deadline: Date? = nil) {
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
