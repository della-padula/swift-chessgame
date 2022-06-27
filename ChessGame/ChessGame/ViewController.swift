//
//  ViewController.swift
//  ChessGame
//
//  Created by denny on 2022/06/20.
//

import SnapKit
import UIKit

class BoardCell: UICollectionViewCell {
    static let identifier: String = "BoardCell"
    private let containerView: UIView = UIView()
    private let labelContainerView: UIView = UIView()
    
    var chessPiece: ChessPiece? {
        didSet {
            chessSymbolLabel.text = chessPiece?.symbol
        }
    }
    
    var position: Position? {
        didSet {
            positionLabel.text = position?.generateStringPosition()
        }
    }
    
    private let positionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .lightGray
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let chessSymbolLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellLayout() {
        contentView.addSubview(containerView)
        containerView.addSubview(positionLabel)
        containerView.addSubview(chessSymbolLabel)
        
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 4
        containerView.backgroundColor = .systemYellow
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        positionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2)
            make.leading.trailing.equalToSuperview()
        }
        
        chessSymbolLabel.snp.makeConstraints { make in
            make.top.equalTo(positionLabel.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
        }
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var boardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
        view.backgroundColor = .white
        view.addSubview(boardCollectionView)
        
        boardCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
        
        GameManager.shared.initializeGame()
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "A2", to: "A3")
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "A3", to: "B3")
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "B7", to: "B6")
        GameManager.shared.displayCurrentBoard()
        
        GameManager.shared.movePiece(from: "B3", to: "B2")
        GameManager.shared.displayCurrentBoard()
        boardCollectionView.reloadData()
    }
    
    private func initCollectionView() {
        boardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        boardCollectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.identifier)
        boardCollectionView.dataSource = self
        boardCollectionView.delegate = self
        boardCollectionView.backgroundColor = .white
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64 // 8 * 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.identifier, for: indexPath) as? BoardCell else {
            return UICollectionViewCell()
        }
        
        let chessPiece = GameManager.shared.getCurrentBoard()[indexPath.row / 8][indexPath.row % 8]
        cell.chessPiece = chessPiece
        cell.position = Position(file: indexPath.row % 8, rank: indexPath.row / 8)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = ((collectionView.frame.width - 32) / 8) - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Do Nothing
        let chessPiece = GameManager.shared.getCurrentBoard()[indexPath.row / 8][indexPath.row % 8]
        let alert = UIAlertController.init(title: "체스 선택됨", message: "\(chessPiece?.position.generateStringPosition() ?? "Invalid Position"), \(chessPiece?.symbol ?? ".")", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
}
