import UIKit

var greeting = "Hello, playground"



struct RockPaperScissors: Equatable {

    enum Option: Comparable, Equatable {
        case rock
        case paper
        case scissors
        static func > (lhs: Self, rhs: Self) -> Bool {
            switch lhs {
            case .scissors: return rhs == .paper
            case .rock: return rhs == .scissors
            case .paper: return rhs == .rock
            }
        }
        static func < (lhs: Self, rhs: Self) -> Bool {
            return rhs > lhs
        }
    }

    static func go(_ lhs: Option, _ rhs: Option) -> String {
        if lhs > rhs {
            return "\(lhs) wins!"
        } else if lhs == rhs {
            return "It's a tie!"
        } else {
            return "\(rhs) wins!"
        }
    }
}

let options: [RockPaperScissors.Option] = [.rock, .paper, .scissors]
for _ in 0...50 {
    let lhs = options.randomElement()!
    let rhs = options.randomElement()!
    print("\(lhs) vs \(rhs)")
    print(RockPaperScissors.go(lhs, rhs))
    print("\n")
}
