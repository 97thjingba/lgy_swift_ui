//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by lgy on 2020/11/3.
//  Copyright © 2020 lgy. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // 这里必须空一行.否则找不到observedObject
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        Grid(items:viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgelinewidth)
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size) ))
    }
    
    // MARK: -Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgelinewidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
