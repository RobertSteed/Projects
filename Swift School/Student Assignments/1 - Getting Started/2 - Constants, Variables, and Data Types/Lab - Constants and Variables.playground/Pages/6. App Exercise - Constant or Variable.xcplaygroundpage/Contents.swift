/*:
## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
- Name: The user's name
- Age: The user's age
- Number of steps taken today: The number of steps that a user has taken today
- Goal number of steps: The user's goal for number of steps to take each day
- Average heart rate: The user's average heart rate over the last 24 hours
 */
let userName = "Rob"
//I chose to make this a constant because names rarely legally change
let userAge = 24
// Age will never change
var numberOfStepsToday = 3_000
//Steps are constantly changing, so it cant be a constant
let goalNumberOfSteps = 10_000
//Goal steps can change, but for this exersize I decided to make it a constant because its very likely that the goal will not change
var averageHeartRate = 90
//as you walk your heart rate changes, so it has to be a variable


/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
 */
