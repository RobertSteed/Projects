import UIKit

var greeting = "Hello, playground"



class Person {
    var name = String
     var age = Int
    var weight = Double
    var favoriteColor = String
    
    init(name: String, age: Int, wight: Double, favoriteColor: String) {
        self.name = name
        self.age = age
        self.weight = wieght
        self.favoriteColor = favoriteColor
    }
    
    class Student: Person {
        var curreentClass = String
        var grade = Int
        var gpa = Double
        
        init(currentClass: String, grade: Int, gpa: Double, name: String, age: Int, weight: Double, favoriteColkor: String) {
            self.currentClass = currentClass
            self.grade = grade
            self.gpa = gpa
            super.init(name: name, age: age, weight: wieght, favoriteColor: favoriteColor)
            
        }
        
    }
    
}




