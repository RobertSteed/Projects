import UIKit

var greeting = "Hello, playground"

func findingLeastCommonMultiple(x: Int, y: Int) -> Int {
    var a = 0
    var b = max(x, y)
    var c = min(x, y)
    
    while c != 0 {
        a = b
        b = c
        c = a % b
    }
    
    return b
}

func finishingTheCodeChallenge(x: Int, y: Int) -> Int {
    return (x * y) / findingLeastCommonMultiple(x: x, y: y)
}

finishingTheCodeChallenge(x: 9, y: 18)

