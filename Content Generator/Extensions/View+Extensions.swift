import SwiftUI

extension View {
    /// Load the commonly used environment objects to use a view in Xcode Previews.
    /// - Returns: A view with loaded environment objects.
    func prepareForPreview() -> some View {
        preparePreview { _ in
            self
        }
    }
}

/// Prepare a view for Xcode Previews by loading the commonly used environment objects.
/// - Parameter view: A closure to build the view that will be loaded with environment objets.
/// - Returns: A view with loaded environment objects.
func preparePreview<Preview: View>(_ view: (PreviewPayload) -> Preview) -> some View {
    assertXcodePreviews()

    let dependencyContainer = DependencyContainer()
    let previewPayload = PreviewPayload(dependencyContainer: dependencyContainer)
    let view = view(previewPayload)
    return previewPayload.loadEnvironment(for: view)
}


struct PreviewPayload {

    /// The dependency container that will be used as an environment object for the Xcode Preview.
    let dependencyContainer: DependencyContainer

    /// Load all environment objects into a specific SwiftUI view.
    /// - Parameter view: The view to load all environment objects.
    /// - Returns: The provided `view` with updated environment objects.
    func loadEnvironment<V: View>(for view: V) -> some View {
        assertXcodePreviews()
        return view.environmentObject(dependencyContainer)
    }
}

public extension ProcessInfo {
    /// Returns whether the process is currently running for Xcode Previews or not.
    var isXcodePreviews: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}

/// Indicates that a Xcode Previews consistency check failed.
///
/// Use this function to stop the program, without impacting the performance of shipping code, when control flow is only expected to reach the call when
/// running in Xcode Previews —for example, a code that creates mock objects for a UI data source.
///
/// - Parameters:
///   - file: The filename to print with message. The default is the file where assertionFailure(_:file:line:) is called.
///   - line: The line number to print along with message. The default is the line number where assertionFailure(_:file:line:) is called.
@inlinable func assertXcodePreviews(_ file: StaticString = #file, line: UInt = #line) {
    if ProcessInfo.processInfo.isXcodePreviews == false {
        assertionFailure("App is not running in Xcode Preview mode", file: file, line: line)
    }
}
