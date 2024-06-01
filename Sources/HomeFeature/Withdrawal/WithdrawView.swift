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

    private var formattedAmount: Binding<String> {
        Binding(
            get: {
                guard let amount = self.store.amount else { return "" }
                return Withdrawal.State.currency.string(from: amount as NSNumber) ?? ""
            },
            set: { newValue in
                let filteredValue = newValue.filter { "0123456789.".contains($0) }
                if let decimalValue = Decimal(string: filteredValue) {
                    self.store.amount = decimalValue
                }
            }
        )
    }

    public var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 8) {
                Group {
                    Text("€")
                    TextField("0", text: self.formattedAmount)
                        .fixedSize(horizontal: true, vertical: false)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.leading)
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
