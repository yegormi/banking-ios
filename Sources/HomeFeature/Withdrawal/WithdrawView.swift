import ComposableArchitecture
import Foundation
import Styleguide
import SwiftUI
import SwiftUIHelpers
import SharedModels

@ViewAction(for: Withdrawal.self)
public struct WithdrawalView: View {
    @Bindable public var store: StoreOf<Withdrawal>

    public init(store: StoreOf<Withdrawal>) {
        self.store = store
    }

    public var body: some View {
        VStack {
        
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
    WithdrawalView(store: Store(initialState: Withdrawal.State(balance: .mock)) {
        Withdrawal()
    })
}
