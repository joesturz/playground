import Foundation

// create a parking lot with large and small spaces



protocol Vehicle {
    var size: VehicleSize { get }
}

class Car: Vehicle {
    var size: VehicleSize = .large
}

class MotorCycle: Vehicle {
    var size: VehicleSize = .small
}

enum VehicleSize {
    case large
    case small
    
    var width: Int {
        switch self {
        case .large: 2
        case .small: 1
        }
    }
}


class ParkingLot {
    var largeVehicles: [Vehicle] = []
    var smallVehicles: [Vehicle] = []
    var largeCapacity: Int
    var smallCapacity: Int
    
    init(largeCapacity: Int, smallCapacity: Int) {
        self.largeCapacity = largeCapacity
        self.smallCapacity = smallCapacity
    }
    
    func park(vehicle: Vehicle) -> Bool {
        switch vehicle.size {
        case .large:
            if largeVehicles.count < largeCapacity {
                largeVehicles.append(vehicle)
                return true
            }
        case .small:
            if smallVehicles.count < smallCapacity {
                smallVehicles.append(vehicle)
                return true
            } else if largeVehicles.count < largeCapacity {
                largeVehicles.append(vehicle)
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func getStatus() {
        let smallStatus = smallVehicles.count == smallCapacity ? "FULL" : "AVAILABLE"
        let largeStatus = largeVehicles.count == largeCapacity ? "FULL" : "AVAILABLE"
        print("[\(smallStatus)] there are \(smallVehicles.count) parked in small spaces")
        print("[\(largeStatus)] there are \(largeVehicles.count) parked in large spaces")
    }
}
