/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */

import Foundation
var items: [Any] = [7, 8.1, "Robert", 4, true, "Duck Hunting", 7.7]

print(items)



//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for item in items {

if let integer = item as? Int {
    print("The Integer has a value of \(integer)")
}
if let string = item as? String {
    print("The string has a value of \(string)")
}
if let double = item as? Double {
    print("The Double has a value of \(double)")
}
if let boolean = item as? Bool {
    print("The value of the Bool is \(boolean)")
}
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var list: [String: Any] = ["Amount of Ducks I will Kill": 10_000, "Scale of one out of ten": 7.5, "Is this true?": false]


print(list)



//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0.0

for (_, thing) in list {
    if thing is String {
        total = total + Double(1)
    } else if let number = thing as? Int {
        total = total + Double(number)
    } else if let number = thing as? Double {
        total = total + number
    } else if let boolean = thing as? Bool {
        if (boolean) {
            total = total + 2
        } else {
            total = total - 3
        }
        
    }
    
}

//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0.0

for (_, value) in list {
    if value is String {
        total2 = total2 + Double(1)
    } else if let number = value as? Int {
        total2  = total2 + Double(number)
    } else if let number = value as? Double {
        total2 = total2 + number
    }
}

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
