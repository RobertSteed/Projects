import UIKit

var greeting = "Hello, playground"

var dataSet = [1, 3, 6, 2, 4, 5]

func bubbleSort(_ arr: [Int]) -> [Int] {
    var dataSet = arr
let lastPosition = dataSet.count - 1
var swap = true
while swap == true {
    swap = false
    for i in 0..<lastPosition {
        if dataSet[i] > dataSet [i + 1] {
            let temp = dataSet [i + 1]
            dataSet [i + 1] = dataSet[i]
            dataSet[i] = temp
            
            swap = true
        }
    }
}
    return dataSet
}
bubbleSort(dataSet)


