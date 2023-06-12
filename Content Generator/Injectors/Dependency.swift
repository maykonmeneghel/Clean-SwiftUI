import SwiftUI

@propertyWrapper
struct Dependency<Value>: DynamicProperty {
    @EnvironmentObject private var dependencyContainer: DependencyContainer
    
    var wrappedValue: Value {
        get {
            dependencyContainer[keyPath: key]
        }
        nonmutating set {
            dependencyContainer[keyPath: key] = newValue
        }
    }
    
    private let key: ReferenceWritableKeyPath<DependencyContainer, Value>
    
    init(_ key: ReferenceWritableKeyPath<DependencyContainer, Value>) {
        self.key = key
    }
}
