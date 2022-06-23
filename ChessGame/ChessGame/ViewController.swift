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
        
        GameManager.shared.initializeGame()
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "A2", to: "A3")
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "A3", to: "B3")
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "B7", to: "B6")
        GameManager.shared.displayCurrentBoard()
    }

}

