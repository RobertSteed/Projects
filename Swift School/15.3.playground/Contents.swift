import UIKit

var greeting = "Hello, playground"

func domath(num: String) -> Bool {
    var char: Character
    for i in num {
        if i != char {
            return true
        } else {
            return false
        }
    }
   return true
}

