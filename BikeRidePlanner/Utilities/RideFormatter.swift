import Foundation

struct RideFormatter {

    static func currency(_ amount: Double) -> String {

        return String(
            format: "₱%.2f",
            amount
        )
    }
}

