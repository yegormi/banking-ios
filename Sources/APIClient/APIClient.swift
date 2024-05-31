import Dependencies
import DependenciesMacros
import SharedModels
import SwiftUI

@DependencyClient
public struct APIClient: Sendable {
    public var fetchBalance: @Sendable () async throws -> AppBalance
    public var fetchCards: @Sendable () async throws -> [AppCard]
    public var fetchTransactions: @Sendable () async throws -> [AppTransaction]
}

public extension DependencyValues {
    var apiClient: APIClient {
        get { self[APIClient.self] }
        set { self[APIClient.self] = newValue }
    }
}
