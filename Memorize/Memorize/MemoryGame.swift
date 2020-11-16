//
//  MemoryGame.swift
//  Memorize
//
//  Created by lgy on 2020/11/8.
//  Copyright © 2020 lgy. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        
        
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
             self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    // This Model called when it is initialized
    
    init(numberOfPairsOfCards: Int, emojis:Array<CardContent>) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = emojis[pairIndex]
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    struct Card:Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
 
