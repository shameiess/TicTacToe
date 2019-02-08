//
//  Player.swift
//  TicTacToe
//
//  Created by Kevin Nguyen on 8/16/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

enum Player : String {
    case X = "X"
    case O = "O"
    
    func other() -> Player {
        switch self {
        case .X:
            return .O
        default:
            return .X
        }
    }
}
