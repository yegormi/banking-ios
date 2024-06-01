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
                        Button("See all") {}
                    }
                } content: {
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach(self.store.cards) { card in
                            AppCardCell(card: card)
                        }
                    }
                }

                CardView {
                    HStack {
                        Text("Recent transactions")
                            .font(.system(size: 17, weight: .semibold))
                        Spacer()
                        Button("See all") {}
                    }
                } content: {
                    VStack(spacing: 16) {
                        ForEach(store.transactions) { transaction in
                            CardTransactionCell(transaction: transaction)
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
