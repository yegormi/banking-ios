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
        List {
            VStack(alignment: .leading, spacing: 4) {
                Text("🇪🇺 EUR account")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.gray)
                Text("€153,000.85")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(Color.primary)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Action for the plus button
                }) {
                    Image(systemName: "plus")
                }
            }
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
