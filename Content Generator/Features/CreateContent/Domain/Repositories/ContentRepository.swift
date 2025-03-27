protocol ContentRepository {
    func fetchContents() async throws -> [ContentEntity]
}
