//
//  RoverMovement_Tests.swift
//  RedRoverTests
//
//  Created by Manju Kiran on 20/04/2021.
//

import XCTest
@testable import RedRover


class RoverMovement_Tests: XCTestCase {

    func test_movingforward_when_facing_east_increments_x() {
        let position = GridPosition(x: 0, y: 0)
        let newPosition  = RoverOrientation.east.applyMovement(position: position,
                                                               movement: RoverMovementType.forward)
        XCTAssertEqual(newPosition.x, position.x + 1 )
        XCTAssertEqual(newPosition.y, position.y )
    }
    
    func test_movingforward_when_facing_west_decrements_x() {
        let position = GridPosition(x: 0, y: 0)
        let newPosition  = RoverOrientation.west.applyMovement(position: position,
                                                               movement: RoverMovementType.forward)
        XCTAssertEqual(newPosition.x, position.x - 1 )
        XCTAssertEqual(newPosition.y, position.y )
    }
    
    func test_movingforward_when_facing_north_increments_y() {
        let position = GridPosition(x: 0, y: 0)
        let newPosition  = RoverOrientation.north.applyMovement(position: position,
                                                               movement: RoverMovementType.forward)
        XCTAssertEqual(newPosition.x, position.x )
        XCTAssertEqual(newPosition.y, position.y + 1 )
    }

    func test_movingforward_when_facing_south_decrements_y() {
        let position = GridPosition(x: 0, y: 0)
        let newPosition  = RoverOrientation.south.applyMovement(position: position,
                                                               movement: RoverMovementType.forward)
        XCTAssertEqual(newPosition.x, position.x )
        XCTAssertEqual(newPosition.y, position.y - 1 )
    }
    
    func test_changingOrientation_when_facing_AnyDirection_Applies_noMovement() {
        let position = GridPosition(x: 0, y: 0)
        for orientation in RoverOrientation.allCases {
            for movement in RoverMovementType.allCases.filter({ $0 != .forward }) {
                let newPosition = orientation.applyMovement(position: position,
                                                            movement: movement)
                XCTAssertEqual(newPosition.x, position.x )
                XCTAssertEqual(newPosition.y, position.y)
                
                let newOrientation = orientation.applyDirection(movement: .forward)
                XCTAssertEqual(orientation, newOrientation)
            }
        }
    }
    
    func test_applyingMovement_when_facing_AnyDirection_Applies_noDirection() {
        for orientation in RoverOrientation.allCases {
            let newOrientation = orientation.applyDirection(movement: .forward)
            XCTAssertEqual(orientation, newOrientation)
        }
    }
    
    func test_ApplyingOrientations_Combinations() {
        for orientation in RoverOrientation.allCases {
            for movement in RoverMovementType.allCases {
                let newOrientation = orientation.applyDirection(movement: movement)
                switch movement {
                case .right:
                    switch orientation {
                    case .north: XCTAssertEqual(newOrientation,.east)
                    case .south: XCTAssertEqual(newOrientation,.west)
                    case .east: XCTAssertEqual(newOrientation,.south)
                    case .west: XCTAssertEqual(newOrientation,.north)
                    }
                case .left:
                    switch orientation {
                    case .north: XCTAssertEqual(newOrientation, .west)
                    case .south: XCTAssertEqual(newOrientation, .east)
                    case .east: XCTAssertEqual(newOrientation, .north)
                    case .west: XCTAssertEqual(newOrientation, .south)
                    }
                default: XCTAssertEqual(newOrientation, orientation)
                }
            }
        }
    }

}
