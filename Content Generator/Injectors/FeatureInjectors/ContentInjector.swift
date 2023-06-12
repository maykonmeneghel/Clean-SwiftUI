class ContentInjector {
    
    // Datasources
    lazy var contentRemoteDatasource: ContentDatasource = {
        ContentRemoteDatasource()
    }()
    
    // Repositories
    lazy var contentRepository: ContentRepository = {
        ContentRepositoryImpl(datasource: contentRemoteDatasource)
    }()
    
    // UseCases
    lazy var fetchContentsUseCase: FetchContentsUseCase = {
        FetchContentsUseCaseImpl(repository: contentRepository)
    }()
    
    // ViewModel
    lazy var contentViewModel: ContentViewModel = {
        ContentViewModel(fetchContentsUseCase)
    }()
}
