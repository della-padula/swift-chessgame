//
//  Extensions.swift
//  ChessGame
//
//  Created by denny on 2022/06/23.
//

import Foundation

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
    
    func verifyRange() -> Bool {
        let regex = "[A-H][1-8]"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
