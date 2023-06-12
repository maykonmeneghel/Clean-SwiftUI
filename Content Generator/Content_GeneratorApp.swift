import SwiftUI

@main
struct Content_GeneratorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DependencyContainer())
        }
    }
}
