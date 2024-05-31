import AppFeature
import ComposableArchitecture
import SwiftUI
import Styleguide

@main
struct BankingApp: App {
    let store: StoreOf<AppReducer>
    
    init() {
        self.store = Store(initialState: AppReducer.State()) {
            AppReducer()
                ._printChanges()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: self.store)
                .scrollIndicators(.never)
        }
    }
}
