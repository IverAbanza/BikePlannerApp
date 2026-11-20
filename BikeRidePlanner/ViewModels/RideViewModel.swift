import SwiftUI
import Combine

final class RideViewModel: ObservableObject {

    // MARK: - User Inputs

    @Published var riderName: String = ""

    @Published var selectedBike: BikeType = .mountain

    @Published var helmetRequired: Bool = true

    @Published var distance: Double = 20

    @Published var numberOfRiders: Int = 1

    @Published var rideDate: Date = Date()

    // MARK: - Alert Properties

    @Published var showAlert: Bool = false

    @Published var alertTitle: String = ""

    @Published var alertMessage: String = ""

    @Published var generatedRide: Ride?

    // MARK: - Generate Ride

    func generateRide() {

        let cleanName = riderName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !cleanName.isEmpty else {

            alertTitle = "Missing Information"

            alertMessage = "Please enter your name before generating your ride summary."

            showAlert = true

            return
        }

        let ride = Ride(
            riderName: cleanName,
            bikeType: selectedBike,
            helmetRequired: helmetRequired,
            distance: distance,
            numberOfRiders: numberOfRiders,
            rideDate: rideDate
        )

        generatedRide = ride

        alertTitle = "Ride Successfully Created!"

        alertMessage = """
        Hello, \(ride.riderName)!

        Your ride has been successfully planned.

        BIKE INFORMATION

        Bike Type: \(ride.bikeType.rawValue)
        Number of Riders: \(ride.numberOfRiders)
        Helmet Required: \(ride.helmetRequired ? "Yes" : "No")

        RIDE DETAILS

        Distance: \(Int(ride.distance)) km
        Ride Date: \(ride.rideDate.formatted(date: .long, time: .omitted))
        Estimated Duration: \(ride.estimatedDuration) minutes

        ESTIMATED COST

        ₱\(String(format: "%.2f", ride.estimatedCost))

        Enjoy your ride and stay safe!
        """

        showAlert = true
    }
}

