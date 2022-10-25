import Foundation

//Parking System Problem
//
//Implement a car parking system (with N parking spaces)
//Make your own choice of data structure
//Requirements:
// 1. Store the `Vehicle` entering the parking system
// 2. Handle the state of a parking space on entry and exit of a vehicle
// 3. Upon exit, the customer is charged a parking fee and make space for new vehicles
//
//Vehicles are charged, every hour:
// 1. $3 from 6am to 10am
// 2. $1 from 10am to Midnight. // 10-24
// 3. Parking is free from Midnight to 6am < 6
//
//Examples:
// 1. Vehicles that use the car park from 3am to 9am are charged - $9
// 2. Vehicles that use the car park from 11am to 9pm are charged - $10
//
//Note:
// 1. Calculate time in Int as 1,2...24 - Vehicles are charged for an entire hour on entry.
// 2. Cars will not be parked for more than 24 hours
//

//let system = ParkingSystem()

//system.intakeCar(plateNum: "Joe1", time: 3)
//print(system.exitLot(plateNum: "Joe1", time: 9))
//
//
//system.intakeCar(plateNum: "Joe2", time: 11)
//print(system.exitLot(plateNum: "Joe2", time: 21))


public class ParkingSystem {
    var parkingLot: [String: Int] = [:]

    public init() { }

    //return the index
    public func intakeCar(plateNum: String, time: Int){
        parkingLot[plateNum] = time
        return
    }
    //car is location in the array

    public func exitLot(plateNum: String, time: Int) -> Int  {
        var fee = 0
        guard let startTime = parkingLot[plateNum] else {
            return 0
        }
        for i in (startTime..<time) {
            if i >= 6 && i <= 9 {
                fee += 3
            } else if i >= 10 && i <= 24 {
                fee += 1
            }
        }
        parkingLot[plateNum] = nil
        return fee
    }

}



