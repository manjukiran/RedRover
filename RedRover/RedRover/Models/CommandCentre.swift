//
//  CommandCentre.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

class RedRoverCommandCentre {

    let input: ProgramInput?
    var movementsToAvoid: [String : [RoverMovementType]] = [:]

    init(input: ProgramInput?) {
        self.input = input
    }

    func executeMovements() -> [String] {
        var stringArray: [String] = []
        guard let input = input else { return  stringArray }
        for instruction in input.instructions {
            let rover = instruction.rover
            for movement in instruction.movements {
                let location = rover.apply(movementType: movement,
                                           avoid: movementsToAvoid)
                if isWithinBounds(location: location) {
                    // New location is within grid, allow movement
                    rover.location = location
                } else {
                    rover.lost = true
                    updateMovementsToAvoid(rover.location, movement: movement)
                }
                if rover.lost { break }
            }
            stringArray.append(rover.locationString)
        }
        return stringArray
    }
    
    private func isWithinBounds(location: RoverLocation) -> Bool {
        guard let input = input else { return  false }
        return (0...input.bounds.x ~= location.position.x)
            && (0...input.bounds.y ~= location.position.y)
    }
    
    private func updateMovementsToAvoid(_ location: RoverLocation,
                                        movement: RoverMovementType) {
        var currentMovementsToAvoid = movementsToAvoid[location.toString()] ?? []
        currentMovementsToAvoid.append(movement)
        movementsToAvoid[location.toString()] = currentMovementsToAvoid
        
    }
}

