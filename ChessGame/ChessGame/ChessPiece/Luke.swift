//
//  Luke.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

class Luke: ChessPiece {
    var position: Position = Position(file: 0, rank: 0)
    
    var chessColor: ChessColor
    
    var symbol: String {
        return chessColor == .black ? "\u{265C}" : "\u{2656}"
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
        // 좌우로만 이동
        
        let x = position.value.file
        let y = position.value.rank
        
        var xPosArr: [Int] = []
        var yPosArr: [Int] = []
        
        (0..<x).enumerated().forEach { idx, value in
            xPosArr.append(value)
            yPosArr.append(y)
        }
        
        ((x + 1)..<8).enumerated().forEach { idx, value in
            xPosArr.append(value)
            yPosArr.append(y)
        }
        
        (0..<y).enumerated().forEach { idx, value in
            xPosArr.append(x)
            yPosArr.append(value)
        }
        
        ((y + 1)..<8).enumerated().forEach { idx, value in
            xPosArr.append(x)
            yPosArr.append(value)
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
