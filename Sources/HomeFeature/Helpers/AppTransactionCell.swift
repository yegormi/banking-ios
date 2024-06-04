import SwiftUI
import Styleguide
import SharedModels

struct CardTransactionCell: View {
    let transaction: CardTransaction

    var body: some View {
        HStack(spacing: 8) {
            Image(self.transaction.tribeTransactionType == .deposit ? .transactionDeposit : .transactionPurchase)
                .overlay(alignment: .bottomTrailing) {
                    switch self.transaction.status {
                    case .completed:
                        EmptyView()
                    case .pending:
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.yellow)
                    case .failed:
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color.red)
                    }
                }
            VStack {
                Text(self.transaction.merchantName)
                    .foregroundStyle(Color.primary)
                    .font(.labelLarge)
                Text("•• 4444")
                    .foregroundStyle(Color.gray)
                    .font(.labelMedium)
            }
            Spacer()
            Text(transaction.tribeTransactionType == .deposit ? "€\(transaction.amount, specifier: "%.2f")" : "-€\(transaction.amount, specifier: "%.2f")")
                .foregroundStyle(self.transaction.tribeTransactionType == .deposit ? Color.green : .black)
                .font(.titleMedium)
        }
    }
}
