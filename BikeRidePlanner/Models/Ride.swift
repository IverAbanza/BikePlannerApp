import Foundation

enum BikeType: String, CaseIterable, Identifiable {

    case mountain = "Mountain Bike"
    case road = "Road Bike"
    case hybrid = "Hybrid Bike"
    case bmx = "BMX Bike"
    case electric = "Electric Bike"

    var id: String {
        rawValue
    }

    var averageSpeed: Double {

        switch self {

        case .road:
            return 25

        case .electric:
            return 22

        case .mountain:
            return 15

        case .hybrid:
            return 18

        case .bmx:
            return 12
        }
    }
}

struct Ride {

    let riderName: String
    let bikeType: BikeType
    let helmetRequired: Bool
    let distance: Double
    let numberOfRiders: Int
    let rideDate: Date

    var estimatedDuration: Int {

        max(
            1,
            Int(
                ceil(
                    distance / bikeType.averageSpeed * 60
                )
            )
        )
    }

    var estimatedCost: Double {

        (50 + distance * 5) * Double(numberOfRiders)
    }
}
