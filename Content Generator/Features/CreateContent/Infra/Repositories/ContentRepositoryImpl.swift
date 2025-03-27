actor ContentRepositoryImpl: ContentRepository {
    private let datasource: ContentDatasource
    
    init(datasource: ContentDatasource) {
        self.datasource = datasource
    }
    
    func fetchContents() async throws -> [ContentEntity] {
        let contents: [ContentModel] = try await datasource.fetchContents()
        return contents.map({ ContentMapper.toEntity(from: $0) })
    }
}
