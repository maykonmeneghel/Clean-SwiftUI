struct ContentRemoteDatasource: ContentDatasource {
    func fetchContents() -> [ContentModel] {
        return [
            ContentModel(theme: "Teste 1", url: "Url 1", level: "Level 1"),
            ContentModel(theme: "Teste 2", url: "Url 2", level: "Level 2"),
            ContentModel(theme: "Teste 3", url: "Url 3", level: "Level 3"),
            ContentModel(theme: "Teste 4", url: "Url 4", level: "Level 4"),
            ContentModel(theme: "Teste 5", url: "Url 5", level: "Level 5")
        ]
    }
}
