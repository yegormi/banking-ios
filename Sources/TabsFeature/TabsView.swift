import ComposableArchitecture
import Helpers
import HomeFeature
import Styleguide
import SwiftUI

public struct TabsView: View {
    @Bindable public var store: StoreOf<Tabs>

    public init(store: StoreOf<Tabs>) {
        self.store = store
        
        // Configure tab bar layout
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowImage = UIColor(Color.black.opacity(0.3)).image(size: CGSize(width: 1.0, height: 1.0))
        appearance.shadowColor = nil

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
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
                .background(Color.appBackground)
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
                .background(Color.appBackground)
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
                .background(Color.appBackground)
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
