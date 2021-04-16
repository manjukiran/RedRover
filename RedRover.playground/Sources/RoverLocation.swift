import Foundation

public enum RoverOrientation: String, CaseIterable {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

public enum RoverMovements: String, CaseIterable {
    case left = "L"
    case right = "R"
    case forward = "F"
}
 
public typealias GridPosition = (x: Int, y: Int)

public class RoverLocation {
    
    var position: GridPosition
    var orientation: RoverOrientation
    
    init(position: GridPosition, orientation: RoverOrientation) {
        self.position = position
        self.orientation = orientation
    }
}

public struct ProgramInput {
    
    public struct RoverMovements {
        let location: RoverLocation
        let movement: [String]
    }
    
    let bounds: GridPosition
    let roverMovements: [RoverMovements]
    
}

public struct RoverMovementInputParser {
    
    static func parse(_ input: String) -> ProgramInput? {
        return nil
    }

}
