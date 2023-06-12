protocol FetchContentsUseCase {
    func call() -> [ContentEntity]
}

struct FetchContentsUseCaseImpl: FetchContentsUseCase {
    
    var repository: ContentRepository
    
    func call() -> [ContentEntity] {
        repository.fetchContents()
    }
}
