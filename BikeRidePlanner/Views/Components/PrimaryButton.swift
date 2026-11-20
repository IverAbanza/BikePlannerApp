
import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 10) {

                Image(systemName: "checkmark.circle.fill")

                Text(title)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .background(Color.green)
            .clipShape(
                RoundedRectangle(cornerRadius: 14)
            )
        }
        .buttonStyle(.plain)
    }
}
