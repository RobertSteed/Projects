import UIKit

var greeting = "Hello, playground"

func factorial(num: Int) -> Int {
    if num == 0 {
        return 1
    } else {
        return num * factorial(num: num - 1)
    }
}

factorial(num: 4)
factorial(num: 10)

