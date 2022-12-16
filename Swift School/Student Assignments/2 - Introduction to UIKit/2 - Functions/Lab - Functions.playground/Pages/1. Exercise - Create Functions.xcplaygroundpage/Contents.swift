/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(_name: String, hobby: String) {
    print("Hi! My name is \(_name) and I like to \(hobby)")
}
introduceMyself(_name:"Robert", hobby:"Hunt")


//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEightBall() -> Int {
    let randomNum = Int.random(in: 0...4)
    switch randomNum {
    case 0:
        print("try again")
    case 1:
        print ("no")
    case 2:
        print("yes")
    case 3:
        print("maybe")
    case 4:
        print("why are you asking me?")
    default:
        print ("Shake me!")
        
    }
    return randomNum
    
}
magicEightBall()
magicEightBall()
magicEightBall()









/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
