/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    var ram: Int
    var yearManufactured: Int
    
    init?(ram: Int, yearManufactured: Int) {
        if ram < 0 || yearManufactured < 1920 || yearManufactured > 2020 {
            return nil
        } else {
        
    self.ram = ram
    self.yearManufactured = yearManufactured
  }
 }
}
//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
var computer1: Computer? = Computer(ram: 20, yearManufactured: 2000)
var computer2: Computer? = Computer(ram: 600, yearManufactured: 1000)

if let computerRam1 = computer1?.ram {
    print(computerRam1)
}
if let computerYearManufactured1 = computer1?.yearManufactured {
    print(computerYearManufactured1)
}
if let computerRam2 = computer2?.ram {
    print(computerRam2)
}
if let computerYearManufactured2 = computer2?.yearManufactured {
    print(computerYearManufactured2)
}



/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */
