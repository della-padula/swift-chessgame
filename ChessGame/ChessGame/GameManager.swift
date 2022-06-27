//
//  GameManager.swift
//  ChessGame
//
//  Created by denny on 2022/06/23.
//

import Foundation

class GameManager {
    static let shared = GameManager()
    private init() { }
    
    func initializeGame() {
        Board.shared.resetBoard()
        Board.shared.initializeBoard()
    }
    
    func movePiece(from: String, to: String) {
        if from.verifyRange(), to.verifyRange() {
            if Board.shared.move(fromPosition: from, toPosition: to) {
                print("Move Success")
            } else {
                print("Move Failed")
            }
        } else {
            print("Failed to vefiry range")
        }
    }
    
    func displayCurrentBoard() {
        Board.shared.displayBoard()
    }
}



