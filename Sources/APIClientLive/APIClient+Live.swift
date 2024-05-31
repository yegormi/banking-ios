import APIClient
import Dependencies
import Foundation
import Helpers
import SharedModels

extension APIClient: DependencyKey {
    public static var liveValue: Self {
        @Dependency(\.continuousClock) var clock

        let client = DataService.shared

        return Self(
            fetchBalance: {
                clock.sleep(for: .seconds(1))
                client.loadMockData(filename: "balance", type: AppBalance.self)
            },
            fetchCards: {
                clock.sleep(for: .seconds(1))
                client.loadMockData(filename: "cards", type: [AppCard].self)
            },
            fetchTransactions: {
                clock.sleep(for: .seconds(1))
                client.loadMockData(filename: "transactions", type: [AppTransaction].self)
            }
        )
    }
}
