import Foundation

enum CardStatus: String, Codable {
    case active
    case locked
    case terminated
}

enum TransactionStatus: String, Codable {
    case completed
    case pending
    case failed
}

enum TransactionType: String, Codable {
    case deposit
    case withdrawal
}

enum LimitType: String, Codable {
    case daily = "PerDay"
    case weekly = "PerWeek"
    case monthly = "PerMonth"
}

struct AppBalance: Codable {
    let balance: Double
}

struct CardHolder: Codable {
    let id: UUID
    let fullName: String
    let email: String
    let logoUrl: URL
}

struct AppCard: Codable, Identifiable {
    let id: UUID
    let cardLast4: String
    let cardName: String
    let isLocked: Bool
    let isTerminated: Bool
    let spent: Double
    let limit: Double
    let limitType: LimitType
    let cardHolder: CardHolder
    let fundingSource: String
    let issuedAt: Date
}

struct AppTransaction: Codable, Identifiable {
    let id: UUID
    let tribeTransactionId: UUID
    let tribeCardId: Int
    let amount: Double
    let status: TransactionStatus
    let tribeTransactionType: TransactionType
    let schemeId: UUID
    let merchantName: String
    let pan: String
}

