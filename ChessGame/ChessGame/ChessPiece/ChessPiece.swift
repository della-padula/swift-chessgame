//
//  ChessPiece.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import Foundation

enum ChessColor {
    case black
    case white
}

protocol ChessPiece {
    typealias Position = (file: Int, rank: Int)
    
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
    
    func convertToIntPair(_ position: String) -> (Int, Int) {
        let x = String(position.prefix(1)).getHorizontalIndex() ?? 0
        let y = Int(position.suffix(1)) ?? 1 - 1
        
        return (x, y)
    }
    
    func generateStringPosition(position: Position) -> String? {
        guard !(position.rank - 1 < 0) else { return nil }
        
        if let prefixString = (65 + (position.file - 1)).getHorizontalIndexString() {
            return prefixString + "\(position.rank + 1)"
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
}
