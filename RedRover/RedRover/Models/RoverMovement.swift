//
//  RoverMovement.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

public enum RoverMovementType: String, CaseIterable {
    case left = "L"
    case right = "R"
    case forward = "F"
}


public enum RoverOrientation: String, CaseIterable {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
    
    func applyDirection(movement: RoverMovementType) -> RoverOrientation {
        switch movement {
        case .right:
            switch self {
            case .north: return .east
            case .south: return .west
            case .east: return .south
            case .west: return .north
            }
        case .left:
            switch self {
            case .north: return .west
            case .south: return .east
            case .east: return .north
            case .west: return .south
            }
        default: return self
        }
    }
    
    func applyMovement(position: GridPosition, movement: RoverMovementType) -> GridPosition {
        switch movement {
        case .forward:
            switch self {
            case .north: return GridPosition(x: position.x, y: position.y + 1)
            case .south: return GridPosition(x: position.x, y: position.y - 1)
            case .east: return GridPosition(x: position.x + 1, y: position.y)
            case .west: return GridPosition(x: position.x - 1, y: position.y)
            }
        default: return position
        }
    }
}
