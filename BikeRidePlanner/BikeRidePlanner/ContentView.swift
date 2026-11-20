import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = RideViewModel()

    var body: some View {

        RidePlannerView(
            viewModel: viewModel
        )
    }
}

#Preview {
    ContentView()
}

