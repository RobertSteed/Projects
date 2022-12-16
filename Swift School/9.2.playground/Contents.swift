import UIKit

var greeting = "Hello, playground"

func findCommonElements(_ arr: [String], b: [String]) -> [String] {
    var arr1 = [String] ()
    for i in arr {
        for j in b {
            if i == j {
                arr1.append(i)
            } else {
                continue
            }
        }
    }
    return arr1
}
let example = ["bird", "lizard", "fish", "cat"]
let example2 = ["dog", "cat", "bird"]

findCommonElements(example, b: example2)


