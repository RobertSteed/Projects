import UIKit

var greeting = "Hello, playground"

func animalAges(humanAge: Int) -> [Int] {
    var arr = [Int] ()
    var dogAge = Int()
    var catAge = Int()
    if humanAge == 1 {
        dogAge = 15
    } else if humanAge == 2 {
        dogAge = 26
        dogAge.append(to: arr)
    } else if humanAge == 3... {
        dogAge = (humanAge - 2) * 5 + 15 + 9
    }
    return []
}



