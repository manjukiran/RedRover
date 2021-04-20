import Foundation

public enum InputSet {
    
    public struct InputParser {
        
        static public let input1 = """
                            53
                            1 1 E
                            RFRFRFRF

                            3 2 N
                            FRRFLLFFRRFLL

                            0 3 W
                            LLFFFLFLFL
                            """
        
        static public let input2 = """
                            55
                            0 0 N
                            RFRFRFRFRFFFRFLFLLF

                            1 4 S
                            FRRFLLFFRRFLL

                            5 5 W
                            LLFFFLFLFL

                            1 1 E
                            RFRFRFRF

                            3 2 N
                            FRRFLLFFRRFLL

                            0 3 W
                            LLFFFLFLFL
                            """
        
        static public let input3_invalidBound = """
                            AB
                            """
        
        static public let input4_invalidRobotLocation = """
                            55
                            A B S
                            RFRFRFRFRFFFRFLFLLF
                            """
        
        static public let input5_invalidRobotOrientation = """
                            55
                            1 1 X
                            RFRFRFRFRFFFRFLFLLF
                            """
        
        static public let input6_invalidRobotMovement = """
                            55
                            1 1 S
                            QWETYUIOP
                            """
    }
    
    public struct RoverInstructions {
        
        static public let roverInstructions1 = (location: "1 1 S",
                                                movementsString: "RFRFRFRFRFFFRFLFLLF")
        
        static public let roverInstructions2 = (location: "2 4 N",
                                                movementsString: "FFFFF")
        
        static public let roverInstructions1_InvalidLocation = (location: "A 5 S",
                                                                movementsString: "FFFFF")
        
        static public let roverInstructions1_InvalidOrientation = (location: "3 5 X",
                                                                   movementsString: "FFFFF")
        
        static public let roverInstructions1_InvalidMovement = (location: "3 5 S",
                                                                movementsString: "FFXFF")
    }
    

    
    public struct Rover {
        
    }
    
    public struct RoverLocation {
        static public let rover_ValidLocation1 = "1 1 E"
        static public let rover_ValidLocation2 = "3 8 S"
        static public let rover_InvalidLocation1 = "3 8 X"
        static public let rover_InvalidLocation2 = "S8S"
        static public let rover_InvalidLocation3 = "3AS"
    }
    
    
    
    
    
    
}


