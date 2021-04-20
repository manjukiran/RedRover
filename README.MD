# RedRover

## Background

This is a simple solution for the Mars Rover challenge, where an input containing grid boundary, rover locations and movements are provided. The system executes the movements and marks rovers as LOST when they go off grid. The system also persists movements that cause the loss of rovers and ignores future instructions to other robots when a similar situation is encountered. 

### Current Solution

#### UI

The solution does not contain any UI Implementation as this was not instructed in the requirements. 

#### Structure

The solution is first developed in PlayGrounds where the classes are all generated along with input samples. This was then augmented into its own Xcode project where the model files could be decoupled and unit-tests could be created.
 
##### Models

- `ProgramInput` : Contains the two main components
    a) Bounds for the area to move within
    b) List of individual Robot position, orientation and movements

- `InputParser` : Parses the input string in the format specified and creates swift objects for easy handling of business logic

- `RoverInstructions` : Class for individual rover and its movements

- `Rover`: Class containing current location (co-ordinate position and orientation) and state of the robot. This class is used to apply the movements of a robot in serial thread. First the orientation change is checked and then a new location after the applied movement is sent back to the command centre. 

    In `RedRoverCommandCentre`,
    if a rover goes beyond the 2-axis (X,Y )grid (i.e x < 0 OR y < 0 OR x > boundary.x, y > boundary.y) then it is marked as `lost`. When a rover is marked as lost, it also updates a hashmap of position, orientation and movement so that other rovers can ignore the same hashmap combination 

- `RoverOrientation` - A simple enum of north, south, east, and west to determine coordinate system changes

- `RoverMovement` -    A simple enum of left, right and forward to aid determine `RoverOrientation` and `RoverLocation` changes

#### UnitTests

The code also contains 99% test coverage. 
