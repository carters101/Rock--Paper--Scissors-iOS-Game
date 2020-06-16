//
//  GameState.swift
//  RPS
//
//  Created by Carter Smith on 6/12/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    var status: String {
        switch self {
        case .start:
            return "Rock, paper, scissors"
        case .win:
            return "You won!"
        case .lose:
            return "You lost!"
        case .draw:
            return "It's a draw!"
        }
    }
}
