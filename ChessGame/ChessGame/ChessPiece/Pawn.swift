//
//  Pawn.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Pawn: ChessPiece {
    var x: Int = 0
    var y: Int = 0
    
    var chessColor: ChessColor
    
    var initialY: Int {
        return 2
    }
    
    init(chessColor: ChessColor, position: String) {
        self.chessColor = chessColor
        if verify(position) {
            let convertedPair = convertToIntPair(position)
            self.x = convertedPair.0
            self.y = convertedPair.1
        }
    }
    
    func availablePositions() -> [String]? {
        // 좌: x - 1, y
        // 상: x, y - 1
        // 우: x + 1, y
        // 하: x, y + 1
        
        let xPosArr = [x - 1, x, x + 1, x]
        let yPosArr = [y, y - 1, y, y + 1]
        
        var availablePositions: [String] = []
        
        for (xPos, yPos) in zip(xPosArr, yPosArr) {
            if let position = generateStringPosition(xPos: xPos, yPos: yPos) {
                availablePositions.append(position)
            }
        }
        
        return availablePositions
    }
}
