# SwiftUI Clean Architecture

This repository contains an example implementation of a SwiftUI structure using the Clean architecture.

## Project Structure

The project is organized into four main layers:

### Domain

The domain layer contains the core structures of the application's business logic.

- **Entities**: Contains the definitions of the data models that represent the domain entities.
- **Repositories**: Interfaces that define the operations for accessing domain data.
- **UseCases**: Implementations of the use cases that contain the application's business logic.

### Infra

The infra layer is responsible for implementing the operations for accessing domain data.

- **Datasource**: Interfaces that define data retrieval, both locally and remotely.
- **Models**: Defines the data models specific to the infra layer.
- **Repositories**: Implementations of the repositories defined in the domain layer.
- **Mappers**: Mapping between the domain data models and the infra layer data models.

### External

The external layer contains the concrete implementations of the datasources defined in the infra layer. This layer may include specific implementations for local or remote access or integrations with external services.

### Presentation

The presentation layer is responsible for displaying data to the user and handling user interaction. It utilizes SwiftUI views for defining the appearance and interaction of the application.

- **ViewModel**: A controller that manages the state and presentation logic of the data.
- **UI**: A folder that contains SwiftUI views.

### Reference:

https://medium.com/@maykonmeneghel_55360/clean-architecture-swiftui-9bb39619af70
