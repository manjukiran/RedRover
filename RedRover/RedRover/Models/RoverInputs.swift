//
//  RoverInputs.swift
//  RedRover
//
//  Created by Manju Kiran on 20/04/2021.
//

import Foundation

public struct ProgramInput {
    
    public let bounds: GridPosition
    public let instructions: [RoverInstructions]
}

public class GridPosition {
    
    var x: Int
    var y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}


public struct InputParser {
    
    static public func parse(_ input: String) -> ProgramInput? {
        var stringArray:[String] = input.components(separatedBy: "\n")
        guard
            let boundsString = stringArray.first,
            boundsString.count == 2,
            let x = Int(boundsString.prefix(1)),
            let y = Int(boundsString.suffix(1)) else {
            print(" Invalid Input");
            return nil
        }
        stringArray.remove(at: 0)
        stringArray = stringArray.filter { !$0.isEmpty }
        guard stringArray.count % 2 == 0 else { // 2 lines per robot
            print(" Invalid Input") ;
            return nil
        }
        
        let bound = GridPosition(x:x, y:y)
        var movementsArray = [RoverInstructions]()
        var index = 0
        while index < stringArray.count {
            if let movement = RoverInstructions.create(from: stringArray[index],
                                                   movementsString: stringArray[index + 1]) {
                movementsArray.append(movement)
            }
            index += 2
        }
        return ProgramInput(bounds: bound, instructions: movementsArray)
    }
}
