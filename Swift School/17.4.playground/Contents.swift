import UIKit

var greeting = "Hello, playground"


func addingLetters(first: String) -> String {
    for letter in first {
        var first = String(Array(repeating: letter, count: 4))
        return first
    }
    return first
}


addingLetters(first: "string")

              
