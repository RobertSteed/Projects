import UIKit

var greeting = "Hello, playground"


var array: [Any]


func checkValue(a: String, x: Int) -> Bool {
    let value = array
    for i in value {
        if let i = value[0...] as? Int {
            return true
        } else if let i = value[0...] as? String {
            return true
        }
        }
        return false
        }


