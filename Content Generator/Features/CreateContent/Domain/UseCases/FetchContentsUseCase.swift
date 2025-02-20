protocol FetchContentsUseCase {
    func call() async throws -> [ContentEntity]
}

struct FetchContentsUseCaseImpl: FetchContentsUseCase {
    
    var repository: ContentRepository
    
    func call() async throws -> [ContentEntity] {
        try await repository.fetchContents()
    }
}
