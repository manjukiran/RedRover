//
//  RoverLocation_Tests.swift
//  RedRoverTests
//
//  Created by Manju Kiran on 20/04/2021.
//

import XCTest
@testable import RedRover


class RoverLocation_Tests: XCTestCase {

    func testLocationInputs() {
        let roverLocation1 = RoverLocation.create(from: InputSet.RoverLocation.rover_ValidLocation1)
        XCTAssertNotNil(roverLocation1)
        XCTAssertEqual(roverLocation1?.toString(), InputSet.RoverLocation.rover_ValidLocation1.removeSpaces())
        
        let roverLocation2 = RoverLocation.create(from: InputSet.RoverLocation.rover_ValidLocation2)
        XCTAssertEqual(roverLocation2?.toString(), InputSet.RoverLocation.rover_ValidLocation2.removeSpaces())
        
        let roverLocation3 = RoverLocation.create(from: InputSet.RoverLocation.rover_InvalidLocation1)
        XCTAssertNil(roverLocation3)
        
        let roverLocation4 = RoverLocation.create(from: InputSet.RoverLocation.rover_InvalidLocation2)
        XCTAssertNil(roverLocation4)
        
        let roverLocation5 = RoverLocation.create(from: InputSet.RoverLocation.rover_InvalidLocation3)
        XCTAssertNil(roverLocation5)
    }

}

private extension String {
    
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
}
