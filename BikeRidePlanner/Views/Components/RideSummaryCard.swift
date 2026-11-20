import SwiftUI

struct RideSummaryCard: View {

    let cost: Double
    let duration: Int

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            SectionHeader(
                title: "Estimated Summary",
                icon: "chart.bar.fill"
            )

            HStack(spacing: 12) {

                summaryItem(
                    title: "Estimated Cost",
                    value: RideFormatter.currency(cost),
                    icon: "banknote"
                )

                Spacer()

                summaryItem(
                    title: "Duration",
                    value: "\(duration) min",
                    icon: "clock"
                )
            }
        }
        .padding(18)
        .background(Color.green.opacity(0.10))
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }

    private func summaryItem(
        title: String,
        value: String,
        icon: String
    ) -> some View {

        VStack(alignment: .leading, spacing: 8) {

            Label(title, systemImage: icon)
                .font(.caption)
                .foregroundColor(.secondary)

            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
    }
}

