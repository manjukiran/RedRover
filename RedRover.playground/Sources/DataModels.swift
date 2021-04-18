import Foundation

/// Ideally we move all individual models into its own files,
/// but Swift Playgrounds do not support multi file swift models, only playgrounds can access them

public typealias GridPosition = (x: Int, y: Int)

public struct ProgramInput {
    
    public let bounds: GridPosition
    public let roverMovements: [RoverMovement]
}

public struct InputParser {
    
    static public func parse(_ input: String) -> ProgramInput? {
        var stringArray:[String] = input.components(separatedBy: "\n")
        guard
            let boundsString = stringArray.first,
            boundsString.count == 2,
            let x = Int(boundsString.prefix(1)),
            let y = Int(boundsString.suffix(1)) else {
            print(" Invalid Input"); return nil
        }
        stringArray.remove(at: 0)
        guard stringArray.count % 2 == 0 else { // 2 lines per robot
            print(" Invalid Input") ;
            return nil
        }
        
        let bound = GridPosition(x:x, y:y)
        var movementsArray = [RoverMovement]()
        var index = 0
        while index < stringArray.count {
            if let movement = RoverMovement.create(from: stringArray[index],
                                                   movementsString: stringArray[index + 1]) {
                movementsArray.append(movement)
            }
            index += 3
        }
        return ProgramInput(bounds: bound, roverMovements: movementsArray)
    }
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

public enum RoverMovementType: String, CaseIterable {
    case left = "L"
    case right = "R"
    case forward = "F"
}

public class Rover {
    
    public var location: RoverLocation
    public var lost: Bool
    
    public init(location: RoverLocation, lost: Bool = false) {
        self.location = location
        self.lost = lost
    }
    
    func apply(movementType: RoverMovementType, bounds: GridPosition) {
        let orientation = location.orientation.applyDirection(movement: movementType)
        let location = orientation.applyMovement(position: self.location.position, movement: movementType)
        if (0...bounds.x ~= location.x) && (0...bounds.y ~= location.y) {
            self.location = RoverLocation(position: location, orientation: orientation)
        } else {
            self.lost = true
        }
    }
    
    
}

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
    
}


public struct RoverMovement {
    
    public let rover: Rover
    public let movement: [RoverMovementType]
    
    static func create(from locationString: String, movementsString: String) -> RoverMovement? {
        let movements = movementsString.compactMap { RoverMovementType(rawValue: "\($0)")}
        guard
            let location = RoverLocation.create(from: locationString),
            movements.count == movementsString.count  else {
            print(" Invalid Input");
            return nil
        }
        return RoverMovement(rover: Rover(location: location),
                             movement: movements)
    }
    
}


