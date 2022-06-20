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
    var x: Int { get set }
    var y: Int { get set }
    
    var initialY: Int { get }
    var chessColor: ChessColor { get set }
    
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
    
    func generateStringPosition(xPos: Int, yPos: Int) -> String? {
        guard !(xPos - 1 < 0) else { return nil }
        
        if let prefixString = (65 + (xPos - 1)).getHorizontalIndexString() {
            return prefixString + "\(yPos + 1)"
        }
        
        return nil
    }
}

extension Int {
    func getHorizontalIndexString() -> String? {
        guard self > 0 && self < 9 else { return nil }
        
        return String(UnicodeScalar(self + 64)!)
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
