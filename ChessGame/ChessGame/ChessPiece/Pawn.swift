//
//  Pawn.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Pawn: ChessPiece {
    var position: Position = Position(file: 0, rank: 0)
    
    var chessColor: ChessColor
    
    var symbol: String {
        return chessColor == .black ? "\u{265F}" : "\u{2659}"
    }
    
    var initialY: Int {
        return 2
    }
    
    init?(chessColor: ChessColor, position: String) {
        guard position.verifyRange() else { return nil }
        self.chessColor = chessColor
        self.position = position.convertToIntPair()
    }
    
    func availablePositions() -> [String]? {
        // 좌: x - 1, y
        // 우: x + 1, y
        // 하: x, y + 1
        
        let x = position.value.file
        let y = position.value.rank
        
        let xPosArr = [x - chessColor.yOffset, x + chessColor.yOffset, x]
        let yPosArr = [y, y, y + chessColor.yOffset]
        
        let numRange = 0...7
        let posArr = zip(xPosArr, yPosArr).map{Position(file: $0.0, rank: $0.1)}.filter{numRange.contains($0.value.file) && numRange.contains($0.value.rank)}
        
        var availablePositions: [String] = []
        posArr.forEach { arr in
            if let position = arr.generateStringPosition() {
                availablePositions.append(position)
            }
        }
        
        return availablePositions
    }
}
