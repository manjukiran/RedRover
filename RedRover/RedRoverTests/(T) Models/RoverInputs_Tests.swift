//
//  RoverInputs_Tests.swift
//  RedRoverTests
//
//  Created by Manju Kiran on 20/04/2021.
//

import XCTest
@testable import RedRover

class RoverInputs_Tests: XCTestCase {

    
    func test_valid_progamInput() {
        
        let roverInput = InputParser.parse(InputSet.InputParser.input1)
        
        XCTAssertNotNil(roverInput)
        XCTAssertEqual(roverInput?.bounds.x, 5)
        XCTAssertEqual(roverInput?.bounds.y, 3)
        XCTAssertEqual(roverInput?.instructions.count, 3)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.position.x, 1)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.position.y, 1)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.orientation, .east)
        XCTAssertEqual(roverInput?.instructions[0].movements.count, 8)
    }
    
    func test_valid_progamInput2() {
        
        let roverInput = InputParser.parse(InputSet.InputParser.input2)
        
        XCTAssertNotNil(roverInput)
        XCTAssertEqual(roverInput?.bounds.x, 5)
        XCTAssertEqual(roverInput?.bounds.y, 5)
        XCTAssertEqual(roverInput?.instructions.count, 6)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.position.x, 0)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.position.y, 0)
        XCTAssertEqual(roverInput?.instructions[0].rover.location.orientation, .north)
        XCTAssertEqual(roverInput?.instructions[0].movements.count, 19)
    }
    
    func test_invalid_progamInputs() {
        
        let roverInput1 = InputParser.parse(InputSet.InputParser.input3_invalidBound)
        XCTAssertNil(roverInput1)
        
        let roverInput2 = InputParser.parse(InputSet.InputParser.input4_invalidRobotLocation)
        XCTAssertNotNil(roverInput2)
        XCTAssertTrue(roverInput2?.instructions.isEmpty ?? false)
        
        let roverInput3 = InputParser.parse(InputSet.InputParser.input5_invalidRobotOrientation)
        XCTAssertNotNil(roverInput3)
        XCTAssertTrue(roverInput3?.instructions.isEmpty ?? false)
        
        let roverInput4 = InputParser.parse(InputSet.InputParser.input6_invalidRobotMovement)
        XCTAssertNotNil(roverInput4)
        XCTAssertTrue(roverInput4?.instructions.isEmpty ?? false)
        
    }
    
}
