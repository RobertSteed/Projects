import UIKit

var greeting = "Hello, playground"


func heron(a: Double, b: Double, c: Double, s: Double) -> Double {
    let sideOne = a
    let sideTwo = b
    let sideThree = c
    let area = s
    return sqrt(area * (area - sideOne) * (area - sideTwo) * (area - sideThree))
    
}


func cobol(a: Double, b: Double, c: Double) -> Double {
    let side1 = a
    let side2 = b
    let side3 = c
    
    return (side1 + side2 + side3) / 2
    
}

