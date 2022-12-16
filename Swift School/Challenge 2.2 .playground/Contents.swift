import UIKit

var greeting = "Hello, playground"



struct Rectangle {
    var sideA: Int
    var sideB: Int
    
    
    func area() -> Int {
        return sideA * sideB
    }
    func perimeter() -> Int {
        return sideA * 2 + sideB * 2
        
    
            
        }
        
    }


var shape = Rectangle(sideA: 10, sideB: 5)
shape.area()
shape.perimeter()











