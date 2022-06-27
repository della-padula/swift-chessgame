//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by denny on 2022/06/20.
//

import XCTest
@testable import ChessGame

final class ChessGameTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBoard() {
        Board.shared.resetBoard()
        Board.shared.initializeBoard()
        
        XCTAssertTrue(Board.shared.move(fromPosition: "A2", toPosition: "A3"))
        XCTAssertTrue(Board.shared.move(fromPosition: "A3", toPosition: "B3"))
        
        XCTAssertFalse(Board.shared.move(fromPosition: "B3", toPosition: "B2"))
        XCTAssertFalse(Board.shared.move(fromPosition: "D7", toPosition: "D8"))
    }
    
    func testChessInit() {
        XCTAssertNotNil(Pawn(chessColor: .white, position: "A2"))
        XCTAssertNotNil(Pawn(chessColor: .black, position: "A3"))
        
        XCTAssertNil(Pawn(chessColor: .white, position: "A9"))
        XCTAssertNil(Pawn(chessColor: .white, position: "J1"))
    }
}
