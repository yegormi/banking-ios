import SwiftUI

struct EmptyTabView: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(.appLogo)
            Text("Coming soon")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.gray)
        }
    }
}
