import UIKit

var greeting = "Hello, playground"

func doMath(n: Int, first: Int, second: Int) -> Bool {
    return n.isMultiple(of: first) && n.isMultiple(of: second)
}


