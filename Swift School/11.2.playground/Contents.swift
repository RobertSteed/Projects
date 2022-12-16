import UIKit

var greeting = "Hello, playground"


    
    func isPalindrome (value: [String]) -> Bool {
        return [value] == [value.reversed()]
    }
   
let strings = ["racecar", "dad", "golf", "jury", "mom"]

print (strings)

isPalindrome(value: strings)

