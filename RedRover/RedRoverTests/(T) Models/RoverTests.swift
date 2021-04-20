//
//  RoverTests.swift
//  RedRoverTests
//
//  Created by Manju Kiran on 20/04/2021.
//

import XCTest
@testable import RedRover

class RoverTests: XCTestCase {
    
    private let programInput = InputParser.parse(InputSet.InputParser.input1)!

    private var robot1: RoverInstructions!
    private var robot2: RoverInstructions!
    private var robot3: RoverInstructions!
    
    override func setUp() {
        super.setUp()
        self.robot1 = programInput.instructions[0]
        self.robot2 = programInput.instructions[1]
        self.robot3 = programInput.instructions[2]

    }

    func test_rover_moves_whenLocation_valid() {

        let programInput = ProgramInput(bounds: self.programInput.bounds,
                                        instructions: [robot1])
        
        let commandCentre = RedRoverCommandCentre(input: programInput)
        
        XCTAssertTrue(commandCentre.movementsToAvoid.keys.isEmpty)
        let stringArray = commandCentre.executeMovements()
        XCTAssertEqual(stringArray,["1 1 E"])
        
        XCTAssertTrue(commandCentre.movementsToAvoid.keys.isEmpty)
        XCTAssertFalse(robot1.rover.lost)
        XCTAssertEqual(robot1.rover.locationString, "1 1 E")
    }
    
    func test_rover_movesOffGrid_whenLocation_BeyondGrid() {
        
        let programInput = ProgramInput(bounds: self.programInput.bounds,
                                        instructions: [robot2])
        
        let commandCentre = RedRoverCommandCentre(input: programInput)
        
        XCTAssertTrue(commandCentre.movementsToAvoid.keys.isEmpty)
        let stringArray = commandCentre.executeMovements()
        XCTAssertEqual(stringArray,["3 3 N LOST"])
        
        XCTAssertFalse(commandCentre.movementsToAvoid.keys.isEmpty)
        XCTAssertEqual(commandCentre.movementsToAvoid.keys.first, "33N")
        XCTAssertEqual(commandCentre.movementsToAvoid["33N"], [.forward])
        XCTAssertTrue(robot2.rover.lost)
        XCTAssertEqual(robot2.rover.locationString, "3 3 N LOST")
    }
    
    func test_rover_IgnoresOffGridMovement_whenLocation_BeyondGrid() {
             
        let programInput = ProgramInput(bounds: self.programInput.bounds,
                                        instructions: [robot2, robot3])
        
        let commandCentre = RedRoverCommandCentre(input: programInput)
        
        XCTAssertTrue(commandCentre.movementsToAvoid.keys.isEmpty)

        let stringArray = commandCentre.executeMovements()
        XCTAssertEqual(stringArray,["3 3 N LOST", "2 3 S"])
        
        XCTAssertFalse(commandCentre.movementsToAvoid.keys.isEmpty)
        XCTAssertEqual(commandCentre.movementsToAvoid.keys.first, "33N")
        XCTAssertEqual(commandCentre.movementsToAvoid["33N"], [.forward])
        XCTAssertTrue(robot2.rover.lost)
        XCTAssertEqual(robot2.rover.locationString, "3 3 N LOST")
            
        XCTAssertFalse(robot3.rover.lost)
        XCTAssertEqual(robot3.rover.locationString, "2 3 S")
    }
    
    func test_rover_MovementsInputSet2() {
             
        let commandCentre = RedRoverCommandCentre(input: InputParser.parse(InputSet.InputParser.input2))
        let stringArray = commandCentre.executeMovements()
        XCTAssertEqual(stringArray,[ "1 0 S LOST",
                                     "1 3 S",
                                     "5 5 E LOST",
                                     "1 1 E",
                                     "3 3 N",
                                     "2 4 S"])

        
    }
}
