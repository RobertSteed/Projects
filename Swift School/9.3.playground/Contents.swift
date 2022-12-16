import UIKit

var greeting = "Hello, playground"


enum LoginErrors: Error {
    case notEnoughNumbers
    case tooManyNumbers
}

func phoneNumberCreation(num: [String]) throws -> [String] {
    var num1 = num
    if num1.count < 10 { throw LoginErrors.notEnoughNumbers}
    if num1.count > 10 { throw LoginErrors.tooManyNumbers}
        num1.insert("-", at: 3)
        num1.insert("-", at: 7)
    
    return num1
}

let example = ["8", "0", "1", "8", "8", "5", "3", "9", "7", "7"]
try phoneNumberCreation(num: example)



