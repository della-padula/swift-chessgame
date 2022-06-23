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

    func testExample() throws {
        Board.shared.initializeBoard()
        Board.shared.displayBoard()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testChessMove() throws {
        
    }
}
