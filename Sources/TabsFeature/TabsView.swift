import ComposableArchitecture
import Styleguide
import SwiftUI
import HomeFeature

public struct TabsView: View {
    @Bindable public var store: StoreOf<Tabs>

    public init(store: StoreOf<Tabs>) {
        self.store = store
    }

    public var body: some View {
        TabView(selection: self.$store.tab) {
            NavigationStack {
                HomeView(
                    store: self.store.scope(state: \.home, action: \.home)
                )
                .navigationTitle("Home")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
            .tag(Tabs.State.Tab.account)
            .tabItem {
                Label("Home", image: .homeTab)
            }

            NavigationStack {
                TransactionsView(
                    store: self.store.scope(state: \.transactions, action: \.transactions)
                )
                .navigationTitle("Transactions")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
            .tag(Tabs.State.Tab.account)
            .tabItem {
                Label("Transactions", image: .transactionsTab)
            }

            NavigationStack {
                CardsView(
                    store: self.store.scope(state: \.cards, action: \.cards)
                )
                .navigationTitle("My Cards")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
            .tag(Tabs.State.Tab.account)
            .tabItem {
                Label("My Cards", image: .cardsTab)
            }

            NavigationStack {
                AccountView(
                    store: self.store.scope(state: \.account, action: \.account)
                )
                .navigationTitle("Account")
                .toolbarTitleDisplayMode(.inlineLarge)
            }
            .tag(Tabs.State.Tab.account)
            .tabItem {
                Label("Account", image: .accountTab)
            }
        }
//        .introspect(.tabView, on: .iOS(.v17)) { tabBarController in
//            for viewControllers in tabBarController.viewControllers ?? [] {
//                viewControllers.tabBarItem.imageInsets = .init(top: 3, left: 0, bottom: -3, right: 0)
//            }
//        }
    }
}

#Preview {
    TabsView(store: Store(initialState: Tabs.State()) {
        Tabs()
    })
}
