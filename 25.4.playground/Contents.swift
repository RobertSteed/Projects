import UIKit

var greeting = "Hello, playground"

func gettingTheDivisor(_ numerator: Int, _ denominator: Int) -> Int {
    var a: Int = 0
    var b: Int = max(numerator, denominator)
    var r: Int = min(numerator, denominator)

    while r != 0 {
        a = b
        b = r
        r = a % b
       return b
    }
return (numerator / b) (denominator / b)
}

gettingTheDivisor(15, 25)
