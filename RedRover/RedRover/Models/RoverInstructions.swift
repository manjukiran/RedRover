//
//  RoverInstructions.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

public struct RoverInstructions {
    
    public let rover: Rover
    public let movements: [RoverMovementType]
    
    static func create(from locationString: String, movementsString: String) -> RoverInstructions? {
        let movements = movementsString.compactMap { RoverMovementType(rawValue: "\($0)")}
        guard
            let location = RoverLocation.create(from: locationString),
            movements.count == movementsString.count  else {
            print(" Invalid Input");
            return nil
        }
        return RoverInstructions(rover: Rover(location: location),
                             movements: movements)
    }
    
}
