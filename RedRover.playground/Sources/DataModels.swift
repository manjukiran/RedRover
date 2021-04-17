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
}

public enum RoverMovementType: String, CaseIterable {
    case left = "L"
    case right = "R"
    case forward = "F"
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
    public let location: RoverLocation
    public let movement: [RoverMovementType]
    
    static func create(from locationString: String, movementsString: String) -> RoverMovement? {
        let movements = movementsString.compactMap { RoverMovementType(rawValue: "\($0)")}
        guard
            let location = RoverLocation.create(from: locationString),
            movements.count == movementsString.count  else {
            print(" Invalid Input");
            return nil
        }
        return RoverMovement(location: location, movement: movements)
            
    }
}


