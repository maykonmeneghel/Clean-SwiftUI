import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    
    @StateObject private var viewModel: ContentViewModel
    
    init() {
        let viewModel = DependencyContainer().features.contentFeature.contentViewModel
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            List {
                ForEach(contents, id: \.url) { content in
                    Text(content.theme)
                }
            }
        }
        .task(priority: .background) {
            do {
                try await viewModel.fetchContents()
            } catch {
                // Get the error
                print(error)
            }
        }
    }
}

// MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .prepareForPreview()
    }
}
