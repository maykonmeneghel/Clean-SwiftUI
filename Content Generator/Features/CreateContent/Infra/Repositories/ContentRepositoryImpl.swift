struct ContentRepositoryImpl: ContentRepository {
    var datasource: ContentDatasource
    
    func fetchContents() -> [ContentEntity] {
        let contents: [ContentModel] = datasource.fetchContents()
        return contents.map({ ContentMapper.toEntity(from: $0) })
    }
}
