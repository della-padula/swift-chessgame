//
//  Queen.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Queen: ChessPiece {
    var position: Position = (file: 0, rank: 0)
    
    var chessColor: ChessColor
    
    var symbol: String {
        return chessColor == .black ? "\u{265B}" : "\u{2655}"
    }
    
    var initialY: Int {
        return 2
    }
    
    init(chessColor: ChessColor, position: String) {
        self.chessColor = chessColor
        if verify(position) {
            let convertedPair = convertToIntPair(position)
            self.position = convertedPair
        }
    }
    
    func availablePositions() -> [String]? {
        // 좌: x - 1, y
        // 상: x, y - 1
        // 우: x + 1, y
        // 하: x, y + 1
        
        let x = position.file
        let y = position.rank
        
        let xPosArr = [x - 1, x, x + 1, x]
        let yPosArr = [y, y - 1, y, y + 1]
        let posArr = zip(xPosArr, yPosArr).map{($0.0, $0.1)}
        
        var availablePositions: [String] = []
        
        posArr.forEach { arr in
            if let position = generateStringPosition(position: arr) {
                availablePositions.append(position)
            }
        }
        
        return availablePositions
    }
}
