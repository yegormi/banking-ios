import ComposableArchitecture
import Foundation
import Styleguide
import SwiftUI
import SwiftUIHelpers

@ViewAction(for: Home.self)
public struct HomeView: View {
    @Bindable public var store: StoreOf<Home>

    public init(store: StoreOf<Home>) {
        self.store = store
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let balance = store.balance {
                    CardView {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("🇪🇺 EUR account")
                                .font(.system(size: 15))
                                .foregroundStyle(Color.gray)
                            Text("€\(balance.balance, specifier: "%.2f")")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(Color.primary)
                        }
                    }
                }

                CardView {
                    HStack {
                        Text("My cards")
                            .font(.system(size: 17, weight: .semibold))
                        Spacer()
                        Button("See all") {
                            // Action for see all
                        }
                    }
                } content: {
                    VStack(spacing: 8) {
                        ForEach(store.cards) { card in
                            HStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.black)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text(card.cardLast4)
                                            .foregroundStyle(Color.white)
                                            .font(.system(size: 15, weight: .semibold))
                                    )
                                Text(card.cardName)
                                    .font(.system(size: 17))
                                Spacer()
                            }
                        }
                    }
                }

                CardView {
                    HStack {
                        Text("Recent transactions")
                            .font(.system(size: 17, weight: .semibold))
                        Spacer()
                        Button("See all") {
                            // Action for see all
                        }
                    }
                } content: {
                    VStack(spacing: 8) {
                        ForEach(store.transactions) { transaction in
                            HStack {
                                Image(systemName: transaction.tribeTransactionType == .deposit ? "arrow.down.circle.fill" : "creditcard.fill")
                                    .foregroundStyle(transaction.tribeTransactionType == .deposit ? Color.green : Color.red)
                                    .font(.system(size: 20))
                                VStack(alignment: .leading) {
                                    Text(transaction.merchantName)
                                        .font(.system(size: 17))
                                    Text(transaction.tribeTransactionType == .deposit ? "+€\(transaction.amount, specifier: "%.2f")" : "-€\(transaction.amount, specifier: "%.2f")")
                                        .font(.system(size: 15))
                                        .foregroundStyle(transaction.tribeTransactionType == .deposit ? Color.green : Color.primary)
                                }
                                Spacer()
                            }
                        }
                    }
                }

            }
        }
        .contentMargins(.horizontal, 16, for: .scrollContent)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Action for the plus button
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .onFirstAppear {
            send(.onFirstAppear)
        }
        .onAppear {
            send(.onAppear)
        }
    }
}

#Preview {
    HomeView(store: Store(initialState: Home.State()) {
        Home()
    })
}
