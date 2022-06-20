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
    static let shared = Board()
    private init() { }
    
    private var boardPanel: [[ChessPiece?]] = [[ChessPiece?]](repeating: Array(repeating: nil,count: 8), count: 8)
    
    func initializeBoard() {
        boardPanel.removeAll()
        boardPanel = [[ChessPiece?]](repeating: Array(repeating: nil,count: 8), count: 8)
        
        // Step 1: Set Pawn
        (0..<8).forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString() {
                let blackChesePiece: Pawn = .init(chessColor: .black, position: "\(xPosStr)2")
                let whiteChesePiece: Pawn = .init(chessColor: .white, position: "\(xPosStr)7")
                
                boardPanel[1][xOffset] = blackChesePiece
                boardPanel[6][xOffset] = whiteChesePiece
            }
        }
        
        // Step 2: Set Bishop
        [2, 5].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString() {
                let blackChesePiece: Bishop = .init(chessColor: .black, position: "\(xPosStr)1")
                let whiteChesePiece: Bishop = .init(chessColor: .white, position: "\(xPosStr)8")
                
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 3: Set Luke
        [0, 7].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString() {
                let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1")
                let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8")
                
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 4: Set Knight
        [1, 6].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString() {
                let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1")
                let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8")
                
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 5: Set Queen
        let queenXOffset = 4
        if let xPosStr = queenXOffset.getHorizontalIndexString() {
            let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1")
            let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8")
            
            boardPanel[0][queenXOffset] = blackChesePiece
            boardPanel[7][queenXOffset] = whiteChesePiece
        }
    }
    
    func move(piece: ChessPiece, toPosition: String) {
        
    }
    
    private func checkMoveAvailable(toPosition: String) {
        
    }
    
    func displayBoard() {
        boardPanel.forEach { rankBoard in
            rankBoard.forEach { piece in
                print("\(piece?.symbol ?? ".") ", terminator: "")
            }
            print("")
        }
    }
}
