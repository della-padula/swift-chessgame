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
    
    init(chessColor: ChessColor, position: String) {
        self.chessColor = chessColor
        if verify(position) {
            let convertedPair = position.convertToIntPair()
            self.position = convertedPair
        }
    }
    
    func availablePositions() -> [String]? {
        // 좌: x - 1, y
        // 우: x + 1, y
        // 하: x, y + 1
        
        let x = position.value.file
        let y = position.value.rank
        
        let xPosArr = [x - 1, x + 1, x]
        let yPosArr = [y, y, y + 1]
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
