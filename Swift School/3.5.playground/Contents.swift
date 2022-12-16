import UIKit

var greeting = "Hello, playground"




func answer(numbers: [Int]) -> Int {
    var sum: Int = 0
    for index in numbers {
        
    sum += index * index
        print(sum)
        
        
    }
    return 0
}
answer(numbers: [1,2,3])




