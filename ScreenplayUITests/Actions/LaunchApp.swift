import Foundation

struct LaunchApp: Actionable {
    func perform(_ state: inout AppState) {
        state.app.launch()
    }
}

extension Actionable where StateType == AppState {
    static var launchApp: Self {
        return LaunchApp() as! Self
    }
}
