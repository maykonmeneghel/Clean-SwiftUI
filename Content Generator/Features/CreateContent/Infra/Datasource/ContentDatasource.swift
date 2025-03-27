protocol ContentDatasource {
    func fetchContents() async throws -> [ContentModel]
}
