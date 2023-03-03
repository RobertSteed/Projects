//
//  Card.swift
//  Poker Hands
//
//  Created by Robert Steed on 2/24/23.


enum Suit {
   case spades
   case hearts
   case diamonds
   case clubs
}

struct PlayingCardValue {
   
   let cardValue: Int
   let description: String
   
   init(cardValue: Int) {
       self.cardValue = cardValue
       if cardValue > 10 {
           self.description = ""
       } else {
           self.description = String(cardValue)
       }
   }
   
}

struct Card {
   let rank: PlayingCardValue
   let suit: Suit
   
   var description: String {
       return "\(rank.description)\(suit)"
   }
}
