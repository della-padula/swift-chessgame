//
//  ChessPiece.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

struct Position {
    var value: (file: Int, rank: Int)
    
    init(file: Int, rank: Int) {
        self.value = (file, rank)
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
    
    func verify(_ position: String) -> Bool
    func availablePositions() -> [String]?
}

extension ChessPiece {
    func verify(_ position: String) -> Bool {
        let regex = "[A-H][1-8]"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: position)
    }
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

extension Int {
    func getHorizontalIndexString() -> String? {
        guard self > -1 && self < 8 else { return nil }
        
        return String(UnicodeScalar(self + 65)!)
    }
}

extension String {
    func getHorizontalIndex() -> Int? {
        if let myAscii = Character(self).asciiValue, let initAscii = Character("A").asciiValue {
            return Int(myAscii - initAscii)
        }
        
        return nil
    }
    
    func convertToIntPair() -> Position {
        let x = String(self.prefix(1)).getHorizontalIndex() ?? 0
        let y = (Int(self.suffix(1)) ?? 1) - 1
        return Position(file: x, rank: y)
    }
}
