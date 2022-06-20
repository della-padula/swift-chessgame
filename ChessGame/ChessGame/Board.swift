//
//  Board.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

// 체스 판 초기 셋팅
// 색상 별로 말 개수가 맞는지 확인
// 체스 말 이동 가능 여부 판단: 말에 대한 가용 위치에 포함되는지 검사
// 체스 말 이동하기 (필요 시 상대 말 잡기)
// 흑, 백 점수 계산

class Board {
    var boardPanel: [[ChessPiece?]] = [[ChessPiece?]](repeating: Array(repeating: nil,count: 8), count: 8)
    
    func initializeBoard() {
        boardPanel.removeAll(keepingCapacity: true)
        
        // Step 1: Set Pawn
        (0..<8).forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString() {
                let blackChesePiece: Pawn = .init(chessColor: .black, position: "\(xPosStr)2")
                let whiteChesePiece: Pawn = .init(chessColor: .white, position: "\(xPosStr)7")
                
                boardPanel[xOffset][1] = blackChesePiece
                boardPanel[xOffset][6] = whiteChesePiece
            }
        }
    }
    
    func move(piece: ChessPiece, toPosition: String) {
        
    }
    
    private func isAvailableToMove() {
        
    }
}
