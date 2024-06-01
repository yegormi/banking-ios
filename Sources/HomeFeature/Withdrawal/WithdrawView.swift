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

    @FocusState var focus: Withdrawal.State.Field?

    public var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                Group {
                    Text("€")
                    NumberTextField(
                        value: self.$store.amount,
                        maxLength: 15,
                        decimalPlacesLimit: 2
                    )
                    .focused(self.$focus, equals: .amount)
                }
                .font(.system(size: 34, weight: .bold))
            }
            
            Text("You have \(self.store.balance.balance, specifier: "%.2f")\n available in your balance")
                .font(.system(size: 13, weight: .semibold))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottom) {
            Button("Continue") {
                send(.continueButtonTapped)
            }
            .buttonStyle(.primary(size: .fullWidth))
        }
        .onFirstAppear {
            send(.onFirstAppear)
        }
        .onAppear {
            send(.onAppear)
        }
        .bind(self.$store.focus, to: self.$focus)
    }
}

#Preview {
    WithdrawalView(store: Store(initialState: Withdrawal.State(balance: .mock)) {
        Withdrawal()
    })
}
