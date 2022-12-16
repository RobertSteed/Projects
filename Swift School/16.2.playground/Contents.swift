import UIKit

var greeting = "Hello, playground"

var days: [Int] = []

var sortedDays = days.map {$0 * 7}

var sortedMonths = sortedDays.map{$0 * 4}

var amountOfStepsOverTwentyYears = sortedMonths.reduce(0, +)






