import UIKit

var greeting = "Hello, playground"

func clock(h: Int, m: Int, s: Int) -> Int {
    let a = (h * 3_600_000) + (m * 60_000) + (s * 1_000)
    return a
}


