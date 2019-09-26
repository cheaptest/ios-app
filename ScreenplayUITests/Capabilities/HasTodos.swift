import Foundation

struct HasTodos: Capability {

    let data: MockData

    init(_ data: MockData = .basic) {
        self.data = data
    }

    func perform(_ state: AppState) -> AppState {
        state.app.launchEnvironment["mock"] = data.rawValue
        return state
    }

    typealias StateType = AppState

}
