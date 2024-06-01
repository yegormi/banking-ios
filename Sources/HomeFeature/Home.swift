import APIClientLive
import ComposableArchitecture
import Foundation
import SharedModels

@Reducer
public struct Home: Reducer {
    @ObservableState
    public struct State: Equatable {
        @Presents var destination: Destination.State?

        var balance: AppBalance?
        var cards: [AppCard] = []
        var transactions: [AppTransaction] = []
        var isLoading: Bool = false

        public init() {}
    }

    public enum Action: ViewAction {
        case delegate(Delegate)
        case destination(PresentationAction<Destination.Action>)
        case `internal`(Internal)
        case view(View)

        public enum Delegate {}

        public enum Internal {
            case balanceResponse(TaskResult<AppBalance>)
            case cardsResponse(Result<AppCards, Error>)
            case transactionsResponse(Result<[AppTransaction], Error>)
        }

        public enum View: BindableAction {
            case binding(BindingAction<Home.State>)
            case onFirstAppear
            case onAppear
        }
    }

    @Reducer(state: .equatable)
    public enum Destination {}

    @Dependency(\.apiClient) var api

    public init() {}

    public var body: some ReducerOf<Self> {
        BindingReducer(action: \.view)

        Reduce { state, action in
            switch action {
            case .delegate:
                return .none

            case .destination:
                return .none

            case .internal(.balanceResponse(let result)):
                switch result {
                case .success(let balance):
                    state.balance = balance
                case .failure:
                    state.balance = nil
                }
                return .none

            case .internal(.cardsResponse(let result)):
                switch result {
                case .success(let cardsModel):
                    state.cards = cardsModel.cards
                case .failure:
                    state.cards = []
                }
                return .none

            case .internal(.transactionsResponse(let result)):
                switch result {
                case .success(let transactions):
                    state.transactions = transactions
                case .failure:
                    state.transactions = []
                }
                return .none

            case .view(.binding):
                return .none

            case .view(.onFirstAppear):
                return self.reload(&state)

            case .view(.onAppear):
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }

    private func reload(_ state: inout State) -> Effect<Action> {
        return .run { send in
            await withDiscardingTaskGroup { group in
                group.addTask {
                    await send(.internal(.balanceResponse(TaskResult {
                        try await self.api.fetchBalance()
                    })))
                }

                group.addTask {
                    await send(.internal(.cardsResponse(Result {
                        try await self.api.fetchCards()
                    })))
                }

                group.addTask {
                    await send(.internal(.transactionsResponse(Result {
                        try await self.api.fetchTransactions()
                    })))
                }
            }
        }
    }
}
