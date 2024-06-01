import SwiftUI
import SharedModels

struct AppCardCell: View {
    let card: AppCard
    
    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(Color.primary)
                .frame(width: 48, height: 32)
                .overlay(alignment: .bottomTrailing) {
                    Text(card.cardLast4)
                        .foregroundStyle(Color(.systemBackground))
                        .font(.system(size: 10, weight: .bold))
                        .padding(6)
                }
            Text(card.cardName)
                .foregroundStyle(Color.primary)
                .font(.system(size: 15, weight: .semibold))
        }
    }
}
