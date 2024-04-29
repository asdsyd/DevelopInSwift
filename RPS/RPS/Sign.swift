//
//  Sign.swift
//  RPS
//
//  Created by Asad Sayeed on 29/04/24.
//

import Foundation

enum Sign {
    case rock, paper, scissor
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissor:
            return "✌️"
        }
    }
    
    func gameState(for opponentSign: Sign) -> GameState {
        if opponentSign == self {
    }
}


