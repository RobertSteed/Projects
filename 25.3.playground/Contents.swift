import UIKit

var greeting = "Hello, playground"

func combingingStrings(firstWords: String) -> String? {
    guard firstWords != "" else { return nil }
    var answerString = "#"
    answerString = "#\(firstWords.capitalized.replacingOccurrences(of: " ", with: ""))"
    return answerString
}

combingingStrings(firstWords: "Ryan is cool")
