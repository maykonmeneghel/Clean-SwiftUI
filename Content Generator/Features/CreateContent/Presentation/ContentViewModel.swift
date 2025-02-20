struct ContentViewModel {

@MainActor
class ContentViewModel: ObservableObject {
    
    @Published var contents: [ContentEntity] = []
    
    private var _fetchContentsUseCase: FetchContentsUseCase
    
    init(_ fetchContentsUseCase: FetchContentsUseCase) {
        self._fetchContentsUseCase = fetchContentsUseCase
    }
    
    func fetchContents() -> [ContentEntity] {
        return _fetchContentsUseCase.call()
    }
}
