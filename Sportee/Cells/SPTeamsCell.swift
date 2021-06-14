//
//  SPTeamsCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit



class SPTeamsCell: UICollectionViewCell {
    
    static let reuseID = "TeamCell"
    let teamImageView = SPTeamsImageView(frame: .zero)
    let teamNameLabel = SPTitleLabel(textAlignment: .center, fontSize: 14)

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(team: Team) {
        teamNameLabel.text = team.strTeam
        NetworkManager.shared.downloadImage(from: team.strTeamBadge) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.teamImageView.image = image
            }
        }
    }
    
    
    
    private func configure() {
        
//        layer.cornerRadius = 10
//        layer.borderWidth = 2
//        if traitCollection.userInterfaceStyle == .dark {
//            backgroundColor = UIColor(red: 0.200, green: 0.200, blue: 0.200, alpha: 1.000)
//            layer.borderColor = UIColor.white.cgColor
//        } else {
//            backgroundColor = UIColor(red: 0.876, green: 0.876, blue: 0.876, alpha: 1.000)
//            layer.borderColor = UIColor.black.cgColor
//        }
        
        addSubviews(teamImageView, teamNameLabel)
        
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
           teamImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
           teamImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
           teamImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
           teamImageView.heightAnchor.constraint(equalTo: teamImageView.widthAnchor),

           teamNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
           teamNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
           teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
           teamNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
