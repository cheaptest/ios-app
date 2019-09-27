import Foundation

extension MockData: Capable {
    func perform(_ state: inout AppState) {
        state.app.launchEnvironment["mock"] = rawValue
    }
}

typealias HaveTodos = MockData
