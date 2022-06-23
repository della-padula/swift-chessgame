//
//  Bishop.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Bishop: ChessPiece {
    var position: Position = Position(file: 0, rank: 0)
    
    var chessColor: ChessColor
    
    var symbol: String {
        return chessColor == .black ? "\u{265D}" : "\u{2657}"
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
        // 좌대각, 우대각
        
        let x = position.value.file
        let y = position.value.rank
        
        var xPosArr: [Int] = []
        var yPosArr: [Int] = []
        
        (0..<x).enumerated().forEach { idx, value in
            xPosArr.append(value)
            yPosArr.append(y + (x - value) * chessColor.yOffset)
        }
        
        ((x + 1)..<8).enumerated().forEach { idx, value in
            xPosArr.append(value)
            yPosArr.append(y + (value - x) * chessColor.yOffset)
        }
        
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
