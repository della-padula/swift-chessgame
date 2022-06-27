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
    
    private var whiteScore: Int = 0
    private var blackScore: Int = 0
    
    var currentTurn: ChessColor = .black
    
    func initializeGame() {
        whiteScore = 0
        blackScore = 0
        currentTurn = .black
        
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
    
    func updateScore() {
        
    }
    
    func displayCurrentBoard() {
        Board.shared.displayBoard()
    }
    
    func getCurrentBoard() -> [[ChessPiece?]] {
        return Board.shared.getCurrentBoard()
    }
    
    func getAvailablePositions(position: String) -> [Position]? {
        return Board.shared.getAvailablePositions(atPosition: position)?.map { $0.convertToIntPair() }
    }
}

