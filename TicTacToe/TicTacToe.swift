//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by Kevin Nguyen on 8/16/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

class TicTacToe {
    
    var board:[Player?] = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    var currentPlayer: Player!
    var gameOver = false
    var turnCount = 0
    
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], //horizontal
        				 [0, 3, 6], [1, 4, 7], [2, 5, 8], //vertical
                         [0, 4, 8], [2, 4, 6]]            //diagonals
    
    init() {
        reset()
    }
    
    typealias Winner = ((Player) ->Void)
    
    func checkForWinner(completion: Winner) {
        for combo in winningCombos {
//            let line = combo.map { board[$0] }
            let line = combo.map { (space) -> Player? in
                board[space]
            }
            if (line[0] != nil && line[0] == line[1] && line[1] == line[2]) {
                gameOver = true
                if let winner = line[0] {
                    completion(winner)
                }
            }
        }
    }
    
    typealias Tied = (() ->Void)
    
    func checkIfTied(_ completion: Tied) {
        if turnCount == 9 {
            gameOver = true
            completion()
        }
    }
    
    func reset() {
        board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        currentPlayer = .X
        gameOver = false
        turnCount = 0
    }
}
