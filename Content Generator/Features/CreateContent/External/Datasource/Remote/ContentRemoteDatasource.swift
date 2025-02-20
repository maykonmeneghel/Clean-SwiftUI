struct ContentRemoteDatasource: ContentDatasource {
    func fetchContents() async throws -> [ContentModel] {
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return [
            ContentModel(theme: "Test 1", url: "Url 1", level: "Level 1"),
            ContentModel(theme: "Test 2", url: "Url 2", level: "Level 2"),
            ContentModel(theme: "Test 3", url: "Url 3", level: "Level 3"),
            ContentModel(theme: "Test 4", url: "Url 4", level: "Level 4"),
            ContentModel(theme: "Test 5", url: "Url 5", level: "Level 5")
        ]
    }
}
