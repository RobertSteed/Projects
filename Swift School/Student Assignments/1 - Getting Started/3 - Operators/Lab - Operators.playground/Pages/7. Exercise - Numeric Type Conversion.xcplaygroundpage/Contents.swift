/*:
## Exercise - Numeric Type Conversion

 Create an integer constant `x` with a value of 10, and a double constant `y` with a value of 3.2. Create a constant `multipliedAsIntegers` equal to `x` times `y`. Does this compile? If not, fix it by converting your `Double` to an `Int` in the mathematical expression. Print the result.
 */
let x: Int = 10
let y: Double = 3.2


let typeSafeAnswer = Int(x)*Int(y)

print(typeSafeAnswer)



//:  Create a constant `multipliedAsDoubles` equal to `x` times `y`, but this time convert the `Int` to a `Double` in the expression. Print the result.
let multipliedAsDoubles = Double(x)*Double(y)
print(multipliedAsDoubles)


//:  Are the values of `multipliedAsIntegers` and `multipliedAsDoubles` different? Print a statement to the console explaining why.
print("it is different because one rounds down while the other is giving an exact result. Integers can only show whole numbers.  In this case the number could be so close to 32 that the double just prints 32 while the Int recognizes that the number still isn't 32 and will round it down to 30")


/*:
[Previous](@previous)  |  page 7 of 8  |  [Next: App Exercise - Converting Types](@next)
 */
