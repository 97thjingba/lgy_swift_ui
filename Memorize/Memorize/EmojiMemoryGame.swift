//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by lgy on 2020/11/8.
//  Copyright © 2020 lgy. All rights reserved.
//

import  SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["😊","💢","😜"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count, emojis: emojis)
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

 
