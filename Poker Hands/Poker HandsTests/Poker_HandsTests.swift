//
//  Poker_HandsTests.swift
//  Poker HandsTests
//
//  Created by Robert Steed on 2/20/23.
//

import XCTest
@testable import Poker_Hands

final class Poker_HandsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


//    enum Suit {
//        case spades, clubs, hearts, diamonds
//    }
//
//    enum PlayingCardValue: Int {
//        case two = 2
//        case three = 3
//        case four = 4
//        case five = 5
//        case six = 6
//        case seven = 7
//        case eight = 8
//        case nine = 9
//        case ten = 10
//        case jack = 11
//        case queen = 12
//        case king = 13
//        case ace = 14
//    }
//
////    enum PokerHand: Int {
////        case highCard = 0
////        case pair = 1
////        case twoPair = 2
////        case threeOfAKind = 3
////        case straight = 4
////        case flush = 5
////        case fullHouse = 6
////        case fourOfAKind = 7
////        case straightFlush = 8
////        case royalFlush = 9
////    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    struct Card {
//        var suit: Suit
//        var value: PlayingCardValue
//    }
//
//    struct Hand {
//        let cards: [Card]
//        var handType: PokerHand // Bonus points for changing from a string to a custom enum of all the winningHands
//
//        init?(cards: [Card]) {
//            guard cards.count == 5 else { return nil }
//            self.cards = cards
//        }
//    }
//
//
//    func checkingIfItIsAPair(hands: [Hand]) -> PokerHand {
//            var value: Int
//            var clubs = Suit.clubs
//            var diamonds = Suit.diamonds
//            var spades = Suit.spades
//            var hearts = Suit.hearts
//        if hands.contains(where: Card(suit: <#T##Suit#>, value: <#T##PlayingCardValue#>))
//
//
//            return PokerHand.highCard
//        }
//
//        func determineWinner(hands: [Hand]) -> Hand {
//            return
//        }
//    }

/// determineWinner will take in an array of "Poker" hands and determine which hand is better (according to texas holdem rules).
/// Traditionally in Texas Holdem you are only given 2 cards and then 5 other cards are placed flipped up in front of everyone.
/// In our version each player is given 5 cards with no cards placed on the table.
/// Based on just the 5 cards given in a hand. You are to determine what type of winning hands a player has and which is best.
/// For example a player may have a 2 of a kind and a 3 of a kind in a single hand. 3 of a kind is better than 2 of a kind and should be used to determine if their hand is better than any of the other players hands.
///
/// - Returns: Hand - Which is the hand that won. It is expected that the handType property("2 of a kind", "3 of a kind", "4 of a kind", etc) will have a value when returning the winning hand.
///
///
///

/// Have a function that figures out what hand somebody has. Then put the value of the hand into determining the winner
