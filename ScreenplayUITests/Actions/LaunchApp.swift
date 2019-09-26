import Foundation

struct LaunchApp: Action {
    func perform(_ state: AppState) -> AppState {
        state.app.launch()
        return state
    }

    typealias StateType = AppState

}
