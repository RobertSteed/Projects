import UIKit

var greeting = "Hello, playground"




func codeChallenge(size: Int) -> String {
    var number = ""
    for index in 0...size {
        if index % 2 == 0 {
            number.append ("0") }
         else {
            number.append("1")
        }
    }
    return number
}











