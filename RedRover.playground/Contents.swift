import Foundation

class RedRoverCommandCentre {
    
    let input: ProgramInput?
    var movementsToAvoid: [String : [RoverMovementType]] = [:]
    
    init(input: ProgramInput?) {
        self.input = input
    }
    
    func executeMovements() {
        guard let input = input else { return }
        for instruction in input.instructions {
            let rover = instruction.rover
            for movement in instruction.movements {
                rover.apply(movementType: movement,
                            bounds: input.bounds,
                            avoid: &movementsToAvoid)
                if rover.lost { break }
            }
            print(rover.locationString)
        }
    }
}

let commandCentre = RedRoverCommandCentre(input: InputParser.parse(InputSet.input1))
commandCentre.executeMovements()

