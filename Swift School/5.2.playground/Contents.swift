import UIKit

var greeting = "Hello, playground"



var listA = ["Width": 2, "Height": 2, "Length": 3]

var listB = ["Width2": 5, "Height2": 6, "Length2": 7]

func volume(first: String, second: String) -> String {
    var answer = [String: Int] = String
    for (index, number) in answer {
        
        
    }
    return ""
}




func volumeOfACuboid (_ dimensions: [Int]) -> Int? {
    if dimensions.count != 3 {
        return nil
    }
    
    return dimensions[0] * dimensions[1] * dimensions[2]
}


func differenceInCuboidVolume(a: [Int], b: [Int]) -> Int? {
    if a.count != 3 || b.count != 3 {
        return nil
    }
    if let volumeA = volumeOfACuboid(a), let volumeB = volumeOfACuboid(b) {
        return abs(volumeA - volumeB)
    }
    
}











