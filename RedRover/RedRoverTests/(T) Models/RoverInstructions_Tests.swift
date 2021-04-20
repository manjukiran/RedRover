//
//  RoverInstructions_Tests.swift
//  RedRoverTests
//
//  Created by Manju Kiran on 20/04/2021.
//

import XCTest
@testable import RedRover

class RoverInstructions_Tests: XCTestCase {

    func test_rover_validInstructions1() {
        let inputSet1 = InputSet.RoverInstructions.roverInstructions1
        let roverInstructions = try? XCTUnwrap(RoverInstructions.create(from: inputSet1.location, movementsString: inputSet1.movementsString))
        
        XCTAssertNotNil(roverInstructions)
        XCTAssertNotNil(roverInstructions?.rover)
        XCTAssertEqual(roverInstructions?.rover.locationString, inputSet1.location)
        XCTAssertEqual(roverInstructions?.movements.count, inputSet1.movementsString.count)
    }
    
    func test_rover_validInstructions2() {
        let inputSet2 = InputSet.RoverInstructions.roverInstructions2
        let roverInstructions = try? XCTUnwrap(RoverInstructions.create(from: inputSet2.location, movementsString: inputSet2.movementsString))
        
        XCTAssertNotNil(roverInstructions)
        XCTAssertNotNil(roverInstructions?.rover)
        XCTAssertEqual(roverInstructions?.rover.locationString, inputSet2.location)
        XCTAssertEqual(roverInstructions?.movements.count, inputSet2.movementsString.count)
    }
    
    func test_rover_invalidLocation() {
        let inputSet = InputSet.RoverInstructions.roverInstructions1_InvalidLocation
        let roverInstructions = RoverInstructions.create(from: inputSet.location, movementsString: inputSet.movementsString)
        
        XCTAssertNil(roverInstructions)
        
    }
    
    func test_rover_invalidOrientation() {
        let inputSet = InputSet.RoverInstructions.roverInstructions1_InvalidOrientation
        let roverInstructions = RoverInstructions.create(from: inputSet.location, movementsString: inputSet.movementsString)
        
        XCTAssertNil(roverInstructions)

    }
    
    func test_rover_invalidMovement() {
        let inputSet = InputSet.RoverInstructions.roverInstructions1_InvalidMovement
        let roverInstructions = RoverInstructions.create(from: inputSet.location, movementsString: inputSet.movementsString)
        
        XCTAssertNil(roverInstructions)        
    }
    
}
