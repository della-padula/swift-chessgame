//
//  ViewController.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Board.shared.initializeBoard()
        Board.shared.displayBoard()
        Board.shared.displayAvailablePosition(atPosition: "C1")
        Board.shared.displayAvailablePosition(atPosition: "C8")
        Board.shared.displayAvailablePosition(atPosition: "A1")
        Board.shared.displayAvailablePosition(atPosition: "A8")
    }

}

