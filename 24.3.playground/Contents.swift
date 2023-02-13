import UIKit

var greeting = "Hello, playground"

struct Robot {
    
    
    enum Directions {
        case north
        case south
        case east
        case west
    }
    
    
    
    func walkingRobot(north: Int, east: Int, south: Int, west: Int) -> [Int] {
        var finalPosition: [Int] = []
        var x = north - south
        var y = east - west
        finalPosition.append(y)
        finalPosition.append(x)
        
        return finalPosition
    }
}

