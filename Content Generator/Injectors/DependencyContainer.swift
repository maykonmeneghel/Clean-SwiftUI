import Foundation

class DependencyContainer: ObservableObject {
    var features: FeaturesContainer
    
    init() {
        self.features = FeaturesContainer()
    }
}
