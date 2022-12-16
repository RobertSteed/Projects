import UIKit

var greeting = "Hello, playground"




func racistAgainstGeese(checkingForGeese: [String]) -> [String] {
        if checkingForGeese.contains("African") {
            checkingForGeese.filter { $0 != "African" }
        } else if checkingForGeese.contains("Roman Tufted") {
            checkingForGeese.filter { $0 != "Roman Tufted" }
        } else if checkingForGeese.contains("Toulouse") {
            checkingForGeese.filter { $0 != "Toulouse" }
        } else if checkingForGeese.contains("Pilgrim") {
            checkingForGeese.filter { $0 != "Pilgrim" }
        } else if checkingForGeese.contains("Stienbacher") {
            checkingForGeese.filter { $0 != "Stienbacher" }
        } else {
            return checkingForGeese
        }
    
    return checkingForGeese
}

var arr = ["Mallard", "SpeckledBelly", "Merganser", "African", "Teal", "Pilgrim"]

racistAgainstGeese(checkingForGeese: arr)


