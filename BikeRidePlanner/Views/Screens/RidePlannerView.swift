import SwiftUI

struct RidePlannerView: View {

    @ObservedObject var viewModel: RideViewModel

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 22) {

                    // MARK: - Header

                    VStack(alignment: .leading, spacing: 8) {

                        Image(systemName: "bicycle")
                            .font(.system(size: 48))
                            .foregroundColor(.green)

                        Text("Plan Your Ride")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Customize your cycling experience.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 12)

                    // MARK: - Rider Information

                    InputCard(
                        title: "Rider Information",
                        icon: "person.fill"
                    ) {

                        VStack(alignment: .leading, spacing: 10) {

                            Text("Full Name")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            TextField(
                                "Enter your name",
                                text: $viewModel.riderName
                            )
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled()
                        }
                    }

                    // MARK: - Bike Preferences

                    InputCard(
                        title: "Bike Preferences",
                        icon: "bicycle"
                    ) {

                        VStack(alignment: .leading, spacing: 14) {

                            Text("Select Bike Type")
                                .font(.subheadline)
                                .fontWeight(.medium)

                            Picker(
                                "Bike Type",
                                selection: $viewModel.selectedBike
                            ) {

                                ForEach(BikeType.allCases) { bike in

                                    Text(bike.rawValue)
                                        .tag(bike)
                                }
                            }
                            .pickerStyle(.menu)

                            Divider()

                            Toggle(
                                isOn: $viewModel.helmetRequired
                            ) {

                                Label(
                                    "Helmet Required",
                                    systemImage: "shield.fill"
                                )
                            }
                            .tint(.green)
                        }
                    }

                    // MARK: - Ride Details

                    InputCard(
                        title: "Ride Details",
                        icon: "map.fill"
                    ) {

                        VStack(alignment: .leading, spacing: 18) {

                            // Distance Slider

                            VStack(alignment: .leading, spacing: 10) {

                                HStack {

                                    Text("Riding Distance")

                                    Spacer()

                                    Text(
                                        "\(Int(viewModel.distance)) km"
                                    )
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                }

                                Slider(
                                    value: $viewModel.distance,
                                    in: 5...100,
                                    step: 5
                                )
                                .tint(.green)

                                HStack {

                                    Text("5 km")

                                    Spacer()

                                    Text("100 km")
                                }
                                .font(.caption)
                                .foregroundColor(.secondary)
                            }

                            Divider()

                            // Number of Riders Stepper

                            Stepper(
                                value: $viewModel.numberOfRiders,
                                in: 1...10
                            ) {

                                HStack {

                                    Text("Number of Riders")

                                    Spacer()

                                    Text(
                                        "\(viewModel.numberOfRiders)"
                                    )
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                }
                            }

                            Divider()

                            // Date Picker

                            VStack(alignment: .leading, spacing: 10) {

                                Text("Scheduled Ride")
                                    .font(.subheadline)
                                    .fontWeight(.medium)

                                DatePicker(
                                    "Ride Date",
                                    selection: $viewModel.rideDate,
                                    in: Date()...,
                                    displayedComponents: .date
                                )
                                .tint(.green)
                            }
                        }
                    }

                    // MARK: - Estimated Summary

                    RideSummaryCard(
                        cost: (
                            50 + viewModel.distance * 5
                        ) * Double(viewModel.numberOfRiders),

                        duration: max(
                            1,
                            Int(
                                ceil(
                                    viewModel.distance /
                                    viewModel.selectedBike.averageSpeed * 60
                                )
                            )
                        )
                    )

                    // MARK: - Generate Button

                    PrimaryButton(
                        title: "Generate Ride Summary"
                    ) {

                        viewModel.generateRide()
                    }
                    .padding(.top, 4)
                    .padding(.bottom, 25)
                }
                .padding(.horizontal, 20)
            }
            .background(Color(.systemBackground))
            .navigationTitle("BikeRide Planner")
            .navigationBarTitleDisplayMode(.inline)
            .alert(
                viewModel.alertTitle,
                isPresented: $viewModel.showAlert
            ) {

                Button("Done", role: .cancel) { }

            } message: {

                Text(viewModel.alertMessage)
            }
        }
    }
}

