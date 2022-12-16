import UIKit

var greeting = "Hello, playground"


var numbers: [Int] = [1,2,5,3,9,10]


for index in numbers {
    var specified = numbers
    if specified > 5 {
        print(0)
    } else {
        print(1)
    }
}




func codingChallange(bogusString: String) -> String {
    var newString = ""
    
    for char in bogusString {
        if let intValue = char.wholeNumberValue {
            if intValue < 5 {
                newString += "0"
            } else if intValue >= 5 {
                newString += "1"
            }
        }
    }
    return newString
}

let result = codingChallange(bogusString: "0582038476")

print(result)







