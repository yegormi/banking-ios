import Foundation

public enum CardStatus: String, Codable {
    case active
    case locked
    case terminated
}

public enum TransactionStatus: String, Codable {
    case completed
    case pending
    case failed
}

public enum TransactionType: String, Codable {
    case deposit
    case withdrawal
}

public enum LimitType: String, Codable {
    case daily = "PerDay"
    case weekly = "PerWeek"
    case monthly = "PerMonth"
}

public struct AppBalance: Codable {
    public let balance: Double
}

public struct CardHolder: Codable {
    public let id: UUID
    public let fullName: String
    public let email: String
    public let logoUrl: URL
}

public struct AppCard: Codable, Identifiable {
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

public struct AppTransaction: Codable, Identifiable {
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
