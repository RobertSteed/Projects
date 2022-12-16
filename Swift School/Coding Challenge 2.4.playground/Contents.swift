import UIKit

var greeting = "Hello, playground"





class Person{
    var name: String
    var age: Int
    var height: Double
    var weight: Double
    
    init(name: String, age: Int, height: Double, weight: Double) {
    self.name = name
    self.age = age
    self.height = height
    self.weight = weight
    }
    func greeting(named: String) {
    print("Hello! my name is \(name)!")
    }
    func yearsOld(number: Int) -> Int {
    var number = age
        return number += 1
        print("I am \(number) years old")
        
}

}








