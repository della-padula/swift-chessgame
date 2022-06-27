//
//  ChessPiece.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

struct Position: Equatable {
    var value: (file: Int, rank: Int)
    
    init(file: Int, rank: Int) {
        self.value = (file, rank)
    }
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return (lhs.value.file == rhs.value.file) && (lhs.value.rank == rhs.value.rank)
    }
}

enum ChessColor {
    case black
    case white
    
    var yOffset: Int {
        switch self {
        case .black:
            return 1
        case .white:
            return -1
        }
    }
}

protocol ChessPiece {
    var position: Position { get set }
    var initialY: Int { get }
    var chessColor: ChessColor { get set }
    var symbol: String { get }
    
    func availablePositions() -> [String]?
}

extension Position {
    func generateStringPosition() -> String? {
        guard !(self.value.file < 0), !(self.value.rank < 0) else { return nil }
        
        if let prefixScalar = UnicodeScalar(65 + self.value.file) {
            return String(prefixScalar) + "\(self.value.rank + 1)"
        }
        
        return nil
    }
}
