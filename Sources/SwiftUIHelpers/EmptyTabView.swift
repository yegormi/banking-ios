import SwiftUI

public struct EmptyTabView: View {
    public init() {}
    
    public var body: some View {
        VStack(spacing: 8) {
            Image(.appLogo)
            Text("Coming soon")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(Color.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
