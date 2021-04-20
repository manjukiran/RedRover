//
//  RoverLocation.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

public class RoverLocation {
    
    public var position: GridPosition
    public var orientation: RoverOrientation
    
    static func create(from string: String) -> RoverLocation? {
        guard string.count != 3 else { return nil }
        let stringArray = string.split(separator: " ")
        guard
            let x = Int(stringArray[0]),
            let y = Int(stringArray[1]),
            let orientation = RoverOrientation(rawValue: String(stringArray[2])) else { return nil }
        return RoverLocation(position: GridPosition(x: x, y: y), orientation: orientation)
    }
    
    init(position: GridPosition, orientation: RoverOrientation) {
        self.position = position
        self.orientation = orientation
    }
    
    public func toString() -> String {
        return "\(position.x)\(position.y)\(orientation.rawValue)"
    }
}

