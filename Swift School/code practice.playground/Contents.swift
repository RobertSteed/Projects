import UIKit

var greeting = "Hello, playground"


func daysOfTheWeek(weekday: String) -> String {
    if weekday == "Saturday" || weekday == "Sunday" {
        return "time to relax"
    } else {
        return "time to grind"
    }
}

daysOfTheWeek(weekday: "Monday")

