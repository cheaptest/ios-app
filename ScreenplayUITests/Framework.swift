import Foundation

protocol State {}

protocol Actor {
    associatedtype StateType: State
    var state: StateType { get set }
}

extension Actor {
    // MARK: Perform Task
    mutating func perform<T: Actionable>(_ actions: T...) where StateType == T.StateType {
        actions.forEach { action in
            action.perform(&state)
        }
    }

    // MARK: Have Capability
    mutating func isCapableOf<T: Capable>(_ cap: T) where StateType == T.StateType {
        cap.perform(&state)
    }

    // aliases
    mutating func can<T: Capable>(_ cap: T) where StateType == T.StateType {
        isCapableOf(cap)
    }
    mutating func does<T: Capable>(_ cap: T) where StateType == T.StateType {
        isCapableOf(cap)
    }

    // MARK: Ask Question
    mutating func validate<T: Verifiable>(_ validation: T) where StateType == T.StateType {
        validation.perform(&state)
    }

    // aliases
    mutating func should<T: Verifiable>(_ validation: T) where StateType == T.StateType {
        validate(validation)
    }

}

protocol Actionable {
    associatedtype StateType
    func perform(_ state: inout StateType)
}

struct Action<T>: Actionable {
    func perform(_ state: inout T) {
        action(&state)
    }

    let action: (inout T) -> Void

    typealias StateType = T
}

protocol Capable: Actionable {}
protocol Verifiable: Actionable {}

func +<L: Actionable, R: Actionable>(left: L, right: R) -> Action<L.StateType> where L.StateType == R.StateType {
    return Action { state in
        left.perform(&state)
        right.perform(&state)
    }
}
