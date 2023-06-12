struct ContentViewModel {
    
    private var _fetchContentsUseCase: FetchContentsUseCase
    
    init(_ fetchContentsUseCase: FetchContentsUseCase) {
        self._fetchContentsUseCase = fetchContentsUseCase
    }
    
    func fetchContents() -> [ContentEntity] {
        return _fetchContentsUseCase.call()
    }
}
