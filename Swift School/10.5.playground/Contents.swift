import UIKit

var greeting = "Hello, playground"
func pluralWords(arr: [String]) -> [String] {
    for i in arr {
        if i.last == "s" {
            print (i)
        }
    }
    
    return arr
}
let example = ["hand", "hands", "feet", "legs"]
pluralWords(arr: example)

