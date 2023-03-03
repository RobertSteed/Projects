
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        testing()
    }
   
   let cards: [Card] = []
   
   func checkHand(_ cards: [Card]) -> String {
       let sortedCards: [Card] = cards.sorted(by: {$0.rank.cardValue < $1.rank.cardValue})

       let cardValue = sortedCards.map { $0.rank.cardValue }
       let suits = sortedCards.map { $0.suit }
       
       if Set(suits).count == 1 {
           if cardValue == [10, 11, 12, 13, 14] {
               return "Royal Flush"
           } else if Set(cardValue).count == 1 {
               return "Straight Flush"
           } else if let maxRank = cardValue.max(), maxRank - cardValue.min()! == 4 {
               return "Straight Flush"
           } else {
               return "Flush"
           }
       } else if Set(cardValue).count == 2 {
           let firstCardValueCount = cardValue.filter { $0 == cardValue[0] }.count
           let secondCardValueCount = cardValue.filter { $0 == cardValue[1] }.count
           
           if firstCardValueCount == 4 || secondCardValueCount == 4 {
               return "Four of a Kind"
           } else {
               return "Full House"
           }
       } else if Set(cardValue).count == 3 {
           let rankCounts = cardValue.map { rank in
               return cardValue.filter { $0 == rank }.count
           }
           
           if rankCounts.contains(3) {
               return "Three of a Kind"
           } else {
               return "Two Pair"
           }
       } else if Set(cardValue).count == 4 {
           return "One Pair"
       } else {
           return "High Card"
       }
   }
   
    let test = [
        Card(rank: PlayingCardValue.init(cardValue: 2), suit: .hearts),
        Card(rank: PlayingCardValue.init(cardValue: 7), suit: .clubs),
        Card(rank: PlayingCardValue.init(cardValue: 14), suit: .spades),
        Card(rank: PlayingCardValue.init(cardValue: 2), suit: .diamonds),
        Card(rank: PlayingCardValue.init(cardValue: 2), suit: .hearts)
    ]
    func testing() {
        checkHand(test)
    }
}


