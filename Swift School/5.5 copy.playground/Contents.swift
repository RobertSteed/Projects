import UIKit

var greeting = "Hello, playground"



func dates(number: Int) -> Int {
    let cent = number
        if cent >= 1700 || cent < 1800 {
            return 18
        }
        else if cent >= 1800 || cent < 1900 {
            return 19
        } else if cent >= 1900 || cent < 2000 {
                    return 20
        } else if cent >= 2000 || cent < 2100 {
            return 21
        } else {
            print("Please enter valid date")
        }
    return 0
}

let homework = dates(number: 1850)
print(homework)




