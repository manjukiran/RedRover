//
//  Rover.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

public class Rover {
    
    public var location: RoverLocation
    public var lost: Bool
    public var locationString: String {
        return "\(location.position.x) \(location.position.y) \(location.orientation.rawValue)\(lost ? " LOST" : "")"
    }
    
    public init(location: RoverLocation, lost: Bool = false) {
        self.location = location
        self.lost = lost
    }
    
    public func apply(movementType: RoverMovementType,
                      avoid: [String: [RoverMovementType]]) -> RoverLocation {
        
        guard !(avoid[self.location.toString()]?.contains(movementType) ?? false) else { return self.location
        }
        // ^^ Ignore as a previous rover has disappeared with this combination
                
        let orientation = location.orientation.applyDirection(movement: movementType)
        let location = orientation.applyMovement(position: self.location.position,
                                                 movement: movementType)
        return RoverLocation(position: location, orientation: orientation)
    }
    
}

