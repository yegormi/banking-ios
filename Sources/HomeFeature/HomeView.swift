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
                CardView {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("🇪🇺 EUR account")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)
                        Text("€153,000.85")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(Color.primary)
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
                        ForEach(["Virtual card", "Slack", "Google"], id: \.self) { card in
                            HStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.black)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        Text("4141")
                                            .foregroundStyle(Color.white)
                                            .font(.system(size: 15, weight: .semibold))
                                    )
                                Text(card)
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
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                                .foregroundStyle(Color.green)
                                .font(.system(size: 20))
                            VStack(alignment: .leading) {
                                Text("Load")
                                    .font(.system(size: 17))
                                Text("€1000")
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.green)
                            }
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundStyle(Color.red)
                                .font(.system(size: 20))
                            VStack(alignment: .leading) {
                                Text("Google")
                                    .font(.system(size: 17))
                                Text("..7544")
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            Text("-€500")
                                .font(.system(size: 15))
                                .foregroundStyle(Color.primary)
                        }
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .foregroundStyle(Color.red)
                                .font(.system(size: 20))
                            VStack(alignment: .leading) {
                                Text("Google")
                                    .font(.system(size: 17))
                                Text("..7544")
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            Text("-€1,299")
                                .font(.system(size: 15))
                                .foregroundStyle(Color.primary)
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
