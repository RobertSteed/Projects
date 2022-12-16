import UIKit
import Foundation

var greeting = "Hello, playground"




func check(grade1: Int, grade2: Int, grade3: Int) -> Int? {
    
    if grade1 < 0 || grade1 > 100 || grade2 < 0 || grade2 > 100 || grade3 < 0 || grade3 > 100 {
        return nil
    } else {
        return grade1 + grade2 + grade3 / 3
    }
}
  let number = check(grade1: 79, grade2: 91, grade3: 85)
    
func getGrade(_ s1: Int,_ s2: Int,_ s3: Int) -> String {
    var grade = number
    var returnMessage = ""
    switch grade {
    case 90...100:
        returnMessage = "\(grade): A"
    case 80...89:
        returnMessage = "\(grade): B"
    case 70...79:
        returnMessage = "\(grade): C"
    case 60...69:
        returnMessage = "\(grade): D"
    case 0...59:
        returnMessage = "\(grade): F"
    default:
        returnMessage = "Do your work and turn it in!"
        
    }
    
    return ""
}


