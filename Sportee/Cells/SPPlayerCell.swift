//
//  SPPlayerCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPPlayercell: UITableViewCell {
    
    static let reuseID = "PlayerCell"
    var playerImageView = SPTeamsImageView(frame: .zero)
    var playerNameLabel = SPTitleLabel(textAlignment: .center, fontSize: 14)
    var playerPositionLabel = SPBodyLabel(textAlignment: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(player: Player) {
        playerNameLabel.text = player.strPlayer
        playerPositionLabel.text = player.strPosition
        playerPositionLabel.numberOfLines = 0
        playerPositionLabel.font = UIFont.systemFont(ofSize: 12)
        NetworkManager.shared.downloadImage(from: ((player.strCutout ?? player.strThumb) ?? "")) { [weak self] image in
            guard let self = self else {
                
                return
            }
            DispatchQueue.main.async {
                self.playerImageView.image = image
                
            }
            
        }
    }
    
    private func configure() {
        
        addSubviews(playerImageView, playerNameLabel, playerPositionLabel)
        
        let padding: CGFloat = 8
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            playerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            playerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            playerImageView.widthAnchor.constraint(equalToConstant: 60),
            playerImageView.heightAnchor.constraint(equalToConstant: 60),
            
            playerNameLabel.centerYAnchor.constraint(equalTo: playerImageView.centerYAnchor),
            playerNameLabel.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 30),
            playerNameLabel.widthAnchor.constraint(equalToConstant: 150),
            playerNameLabel.heightAnchor.constraint(equalToConstant: 60),
            
            playerPositionLabel.centerYAnchor.constraint(equalTo: playerImageView.centerYAnchor),
            playerPositionLabel.leadingAnchor.constraint(equalTo: playerNameLabel.trailingAnchor, constant: 20),
            playerPositionLabel.widthAnchor.constraint(equalToConstant: 70),
           playerPositionLabel.heightAnchor.constraint(equalToConstant: 60),
            

        ])
    }
}
