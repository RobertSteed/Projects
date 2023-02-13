import UIKit

var greeting = "Hello, playground"


func fibSeq(n: Int) -> [Int] {
    guard n > 0 else { return [] }
    var answerArray: [Int] = [0, 1]
   var first = 1
    var second = 1
    for i in 2...n {
        i = first + second
        answerArray.append(i)
        
        
    }
    
    return []
}
