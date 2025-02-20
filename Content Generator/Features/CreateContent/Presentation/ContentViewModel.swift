import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var contents: [ContentEntity] = []
    
    private var _fetchContentsUseCase: FetchContentsUseCase
    
    init(_ fetchContentsUseCase: FetchContentsUseCase) {
        self._fetchContentsUseCase = fetchContentsUseCase
    }
    
    func fetchContents() async throws {
        do {
            let data = try await _fetchContentsUseCase.call()
            self.contents = data
        } catch {
            throw error
        }
    }
}
