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
    
    func resetBoard() {
        boardPanel.removeAll()
        boardPanel = [[ChessPiece?]](repeating: Array(repeating: nil,count: 8), count: 8)
    }
    
    func initializeBoard() {
        // Step 1: Set Pawn
        (0..<8).forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString(),
               let blackChesePiece: Pawn = .init(chessColor: .black, position: "\(xPosStr)2"),
               let whiteChesePiece: Pawn = .init(chessColor: .white, position: "\(xPosStr)7") {
                boardPanel[1][xOffset] = blackChesePiece
                boardPanel[6][xOffset] = whiteChesePiece
            }
        }
        
        // Step 2: Set Bishop
        [2, 5].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString(),
               let blackChesePiece: Bishop = .init(chessColor: .black, position: "\(xPosStr)1"),
               let whiteChesePiece: Bishop = .init(chessColor: .white, position: "\(xPosStr)8") {
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 3: Set Luke
        [0, 7].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString(),
               let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1"),
               let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8") {
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 4: Set Knight
        [1, 6].forEach { xOffset in
            if let xPosStr = xOffset.getHorizontalIndexString(),
               let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1"),
               let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8") {
                boardPanel[0][xOffset] = blackChesePiece
                boardPanel[7][xOffset] = whiteChesePiece
            }
        }
        
        // Step 5: Set Queen
        let queenXOffset = 4
        if let xPosStr = queenXOffset.getHorizontalIndexString(),
           let blackChesePiece: Luke = .init(chessColor: .black, position: "\(xPosStr)1"),
           let whiteChesePiece: Luke = .init(chessColor: .white, position: "\(xPosStr)8") {
            boardPanel[0][queenXOffset] = blackChesePiece
            boardPanel[7][queenXOffset] = whiteChesePiece
        }
    }
    
    func move(fromPosition: String, toPosition: String) -> Bool {
        if checkMoveAvailable(fromPosition: fromPosition, toPosition: toPosition) {
            let fromPosition = fromPosition.convertToIntPair()
            let toPosition = toPosition.convertToIntPair()
            
            var fromPiece = boardPanel[fromPosition.value.rank][fromPosition.value.file]
            fromPiece?.position = toPosition
            
            boardPanel[toPosition.value.rank][toPosition.value.file] = fromPiece
            boardPanel[fromPosition.value.rank][fromPosition.value.file] = nil
            
            return true
        }
        return false
    }
    
    private func checkMoveAvailable(fromPosition: String, toPosition: String) -> Bool {
        let availablePositions = getAvailablePositions(atPosition: fromPosition)
        return availablePositions?.count ?? 0 > 0 && (availablePositions?.contains(toPosition) ?? false)
    }
    
    private func getAvailablePositions(atPosition: String) -> [String]? {
        let currentPos: Position = atPosition.convertToIntPair()
        var availablePositions: [String] = []
        if let currentPiece = boardPanel[currentPos.value.rank][currentPos.value.file] {
            let candidatePositions: [String] = currentPiece.availablePositions() ?? []
            if currentPiece is Pawn {
                candidatePositions.forEach { pos in
                    let posPair: Position = pos.convertToIntPair()
                    if boardPanel[posPair.value.rank][posPair.value.file] == nil, let posString = posPair.generateStringPosition() {
                        availablePositions.append(posString)
                    }
                }
                
                return availablePositions
            }
            
            if currentPiece is Bishop {
                candidatePositions.forEach { pos in
                    let posPair: Position = pos.convertToIntPair()
                    if boardPanel[posPair.value.rank][posPair.value.file] == nil, let posString = posPair.generateStringPosition() {
                        availablePositions.append(posString)
                    }
                }
                
                return availablePositions
            }
            
            if currentPiece is Luke {
                candidatePositions.forEach { pos in
                    let posPair: Position = pos.convertToIntPair()
                    if boardPanel[posPair.value.rank][posPair.value.file] == nil, let posString = posPair.generateStringPosition() {
                        availablePositions.append(posString)
                    }
                }
                
                return availablePositions
            }
            
            if currentPiece is Knight {
                
            }
            
            if currentPiece is Queen {
                
            }
        }
        
        return nil
    }
    
    func displayBoard() {
        print("  A B C D E F G H")
        
        boardPanel.enumerated().forEach { index, rankBoard in
            print("\(index + 1)", terminator: " ")
            rankBoard.forEach { piece in
                print("\(piece?.symbol ?? ".")", terminator: " ")
            }
            print("")
        }
        
        print("  A B C D E F G H")
    }
    
    func displayAvailablePosition(atPosition: String) {
        let currentPos: Position = atPosition.convertToIntPair()
        if boardPanel[currentPos.value.rank][currentPos.value.file] != nil {
            let availablePositions = getAvailablePositions(atPosition: atPosition)
            print("Available Positions of \(atPosition): ", terminator: "[ ")
            availablePositions?.forEach { position in
                print("\(position)", terminator: " ")
            }
            print("]")
        } else {
            print("Invalid Position: No Chess Piece")
        }
    }
}
