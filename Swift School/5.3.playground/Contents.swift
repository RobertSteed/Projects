import UIKit

var greeting = "Hello, playground"




func codeChallenge(first: [Int], n: Int)-> [Int] {
    var array = first
    var number = n
    for index in [0...number] {
        array.remove(at: n)
        
    }
    return array
}

codeChallenge(first: [1,2,3,4,5], n: 4)
codeChallenge(first: [7,8,9,11,13,15], n: 9)





