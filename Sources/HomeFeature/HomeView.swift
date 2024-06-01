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
                    VStack(spacing: 8) {
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
                Button {
                    send(.withdrawalButtonTapped)
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
        .sheet(
            item: self.$store.scope(state: \.destination?.withdrawal, action: \.destination.withdrawal)
        ) { store in
            NavigationStack {
                WithdrawalView(store: store)
            }
            .navigationTitle("Transfer")
            .navigationBarTitleDisplayMode(.inline)
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
