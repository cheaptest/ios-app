import Foundation

protocol Actor {
    associatedtype StateType
    var state: StateType { get set }
}

protocol State {}

extension Actor {
    // MARK: Perform Task
    mutating func perform<T: Action>(_ actions: T...) where StateType == T.StateType {
        actions.forEach { action in
            state = action.perform(state)
        }
    }

    // MARK: Have Capability
    mutating func isCapableOf<T: Capability>(_ cap: T) where StateType == T.StateType {
        state = cap.perform(state)
    }

    // aliases
    mutating func can<T: Capability>(_ cap: T) where StateType == T.StateType {
        isCapableOf(cap)
    }
    mutating func does<T: Capability>(_ cap: T) where StateType == T.StateType {
        isCapableOf(cap)
    }

    // MARK: Ask Question
    mutating func validate<T: Validation>(_ validation: T) where StateType == T.StateType {
        state = validation.perform(state)
    }

    // aliases
    mutating func should<T: Validation>(_ validation: T) where StateType == T.StateType {
        validate(validation)
    }

}

protocol Action {
    associatedtype StateType
    func perform(_ state: StateType) -> StateType
}

protocol Capability: Action {}
protocol Validation: Action {}
