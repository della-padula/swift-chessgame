//
//  Queen.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Queen: ChessPiece {
    var position: Position = Position(file: 0, rank: 0)
    
    var chessColor: ChessColor
    
    var symbol: String {
        return chessColor == .black ? "\u{265B}" : "\u{2655}"
    }
    
    var initialY: Int {
        return 2
    }
    
    init(chessColor: ChessColor, position: String) {
        self.chessColor = chessColor
        if position.verifyRange() {
            let convertedPair = position.convertToIntPair()
            self.position = convertedPair
        }
    }
    
    func availablePositions() -> [String]? {
        // 좌: x - 1, y
        // 상: x, y - 1
        // 우: x + 1, y
        // 하: x, y + 1
        
        let x = position.value.file
        let y = position.value.rank
        
        let xPosArr = [x - chessColor.yOffset, x, x + chessColor.yOffset, x]
        let yPosArr = [y, y - chessColor.yOffset, y, y + chessColor.yOffset]
        let posArr = zip(xPosArr, yPosArr).map{Position(file: $0.0, rank: $0.1)}
        
        var availablePositions: [String] = []
        
        posArr.forEach { arr in
            if let position = arr.generateStringPosition() {
                availablePositions.append(position)
            }
        }
        
        return availablePositions
    }
}
