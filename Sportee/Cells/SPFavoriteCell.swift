//
//  SPFavoriteCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 11..
//

import UIKit

enum nbaTeams {
    case atlanta, boston, brok, char
}

class SPFavoriteCell: UITableViewCell {
    
    static let reuseID = "FavoriteCell"
    
    var playerImageView = SPTeamsImageView(frame: .zero)
    var playerNameLabel = SPTitleLabel(textAlignment: .center, fontSize: 16)
    var playerTeamImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(player: Player) {
        playerNameLabel.text = player.strPlayer
        backgroundColor = .systemBackground
        

        self.layer.cornerRadius = 10
        
        let filteredTeamImagesIDDictionary = teamIDsImages.filter { $0.key == player.idTeam }
        if filteredTeamImagesIDDictionary[player.idTeam!] != nil {
            playerTeamImage.image = filteredTeamImagesIDDictionary[player.idTeam!]
        } else {
            playerTeamImage.image = UIImage(named: "nba_logo2")
        }
       

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
        
        addSubviews(playerImageView, playerNameLabel, playerTeamImage)
        playerTeamImage.translatesAutoresizingMaskIntoConstraints = false
        playerImageView.backgroundColor = .systemGroupedBackground
        
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
            
            playerTeamImage.centerYAnchor.constraint(equalTo: playerImageView.centerYAnchor),
            playerTeamImage.leadingAnchor.constraint(equalTo: playerNameLabel.trailingAnchor, constant: 40),
            playerTeamImage.widthAnchor.constraint(equalToConstant: 60),
           playerTeamImage.heightAnchor.constraint(equalToConstant: 60),

        ])
    }

}
