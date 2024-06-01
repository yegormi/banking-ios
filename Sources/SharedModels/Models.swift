import Foundation

public enum CardStatus: String, Codable, Equatable {
    case active
    case locked
    case terminated
}

public enum TransactionStatus: String, Codable, Equatable {
    case completed
    case pending
    case failed
}

public enum TransactionType: String, Codable, Equatable {
    case deposit
    case withdrawal
}

public enum LimitType: String, Codable, Equatable {
    case daily = "PerDay"
    case weekly = "PerWeek"
    case monthly = "PerMonth"
}

public struct AppBalance: Codable, Equatable {
    public let balance: Double
}

public struct AppCards: Codable, Equatable {
    public let cards: [AppCard]
}

public struct CardHolder: Codable, Equatable {
    public let id: UUID
    public let fullName: String
    public let email: String
    public let logoUrl: URL
}

public struct AppCard: Codable, Identifiable, Equatable {
    public let id: UUID
    public let cardLast4: String
    public let cardName: String
    public let isLocked: Bool
    public let isTerminated: Bool
    public let spent: Double
    public let limit: Double
    public let limitType: LimitType
    public let cardHolder: CardHolder
    public let fundingSource: String
    public let issuedAt: Date
}

public struct CardTransaction: Codable, Identifiable, Equatable {
    public let id: UUID
    public let tribeTransactionId: UUID
    public let tribeCardId: Int
    public let amount: Double
    public let status: TransactionStatus
    public let tribeTransactionType: TransactionType
    public let schemeId: UUID
    public let merchantName: String
    public let pan: String
}

