//
//  GameState.swift
//  RPS
//
//  Created by Asad Sayeed on 29/04/24.
//

import Foundation
import UIKit

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors? Choose wisely you have 33% probability"
        case .win:
            return "You have won!"
        case .lose:
            return "Uh Oh you have lost!"
        case .draw:
            return "It's a draw!"
        }
    }
    
    var color: UIColor {
        switch self {
        case .win:
            return UIColor.green
        case .lose:
            return UIColor.red
        case .draw:
            return UIColor.orange
        case .start:
            return UIColor.blue
        }
    }
    
    
}


