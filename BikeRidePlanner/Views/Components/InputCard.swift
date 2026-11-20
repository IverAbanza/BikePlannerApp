import SwiftUI

struct InputCard<Content: View>: View {

    let title: String
    let icon: String
    let content: Content

    init(
        title: String,
        icon: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.icon = icon
        self.content = content()
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            SectionHeader(
                title: title,
                icon: icon
            )

            content
        }
        .padding(18)
        .background(Color(.secondarySystemBackground))
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}

