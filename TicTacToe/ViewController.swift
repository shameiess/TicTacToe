//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kevin Nguyen on 8/16/18.
//  Copyright © 2018 Kevin Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var game = TicTacToe()

    @IBAction func action(_ sender: UIButton) {
        let position = sender.tag
        
        if game.board[position - 1] == nil && game.gameOver == false {
            game.board[position - 1] = game.currentPlayer
            game.turnCount += 1
            setButtonSelection(sender: sender, player: game.currentPlayer)
            game.currentPlayer = game.currentPlayer.other()
        }
        
        game.checkIfTied {
            label.text = "Game is Tied!"
        }
        
        game.checkForWinner { (winner) in
            label.text = "Winner is \(winner.rawValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setButtonSelection(sender: UIButton, player: Player) {
        sender.setTitle(player.rawValue, for: .normal)
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        game.reset()
        label.text = "TicTacToe"
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle("", for: .normal)
        }
    }
}

