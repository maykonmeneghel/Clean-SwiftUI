import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @Dependency(\.features.contentFeature.contentViewModel) var viewModel
    
    @State var contents: [ContentEntity] = []
    
    // MARK: - Body
    var body: some View {
        HStack {
            List {
                ForEach(contents, id: \.url) { content in
                    Text(content.theme)
                }
            }
        }
        .task {
            contents = viewModel.fetchContents()
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
