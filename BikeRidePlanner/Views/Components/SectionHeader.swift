import SwiftUI

struct SectionHeader: View {

    let title: String
    let icon: String

    var body: some View {

        HStack(spacing: 10) {

            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.system(size: 18, weight: .semibold))

            Text(title)
                .font(.headline)
                .fontWeight(.bold)

            Spacer()
        }
    }
}

