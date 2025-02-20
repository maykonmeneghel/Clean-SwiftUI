struct ContentRepositoryImpl: ContentRepository {
    var datasource: ContentDatasource
    
    func fetchContents() -> [ContentEntity] {
        let contents: [ContentModel] = datasource.fetchContents()
    
    func fetchContents() async throws -> [ContentEntity] {
        let contents: [ContentModel] = try await datasource.fetchContents()
        return contents.map({ ContentMapper.toEntity(from: $0) })
    }
}
