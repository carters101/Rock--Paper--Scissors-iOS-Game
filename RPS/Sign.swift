//
//  Sign.swift
//  RPS
//
//  Created by Carter Smith on 6/12/20.
//  Copyright © 2020 Carter Smith. All rights reserved.
//

import Foundation
import GameplayKit

let randomValue = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign {
    let sign = randomValue.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var chooseSign: String {
    switch self {
    case .rock:
        return "👊"
    case .paper:
        return "✋"
    case .scissors:
        return "✌️"
    }
    }
    
    func compareSigns(computer: Sign) -> GameState {
        switch self {
        case .rock:
            switch computer {
            case .rock:
                return .draw
            case .paper:
                return .lose
            case .scissors:
                return .win
            }
        case .paper:
            switch computer {
            case .paper:
                return .draw
            case .rock:
                return .win
            case .scissors:
                return .lose
            }
        case .scissors:
            switch computer {
            case .scissors:
                return .draw
            case .rock:
                return .lose
            case .paper:
                return .win
            }
        }
    }
}
