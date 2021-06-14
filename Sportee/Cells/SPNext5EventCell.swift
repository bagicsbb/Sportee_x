//
//  SPNext5EventCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 25..
//

import UIKit

class SPNext5EventCell: UITableViewCell {
    
    static let reuseID = "next5EventCell"
    var homeTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 16)
    var awayTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 16)
    var homeBadgeImage = UIImageView(frame: .zero)
    var awayBadgeImage = UIImageView(frame: .zero)
    var dateLabel = SPBodyLabel(textAlignment: .center)
    let timeLabel = SPBodyLabel(textAlignment: .center)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(event: Next5EventModel) {
        homeTeamLabel.text = event.strHomeTeam
        awayTeamLabel.text = event.strAwayTeam
        dateLabel.text = event.dateEvent
        timeLabel.text = event.strTime
        
        let fileteredHomeDictionary = teamIDsImages.filter { $0.key == event.idHomeTeam }
        let filteredAwayDictionary = teamIDsImages.filter { $0.key == event.idAwayTeam }
        
        homeBadgeImage.image = fileteredHomeDictionary[event.idHomeTeam!]
        awayBadgeImage.image = filteredAwayDictionary[event.idAwayTeam!]

    }
    
    private func configure() {
        dateLabel.font = UIFont.systemFont(ofSize: 9)
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        homeBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        awayBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        addSubviews(homeTeamLabel, timeLabel, dateLabel, awayTeamLabel, homeBadgeImage, awayBadgeImage)
        translatesAutoresizingMaskIntoConstraints = false
   
        let padding: CGFloat = 3
        NSLayoutConstraint.activate([
            
            homeTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            homeTeamLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            homeTeamLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            homeTeamLabel.widthAnchor.constraint(equalToConstant: 120),
            
            homeBadgeImage.centerXAnchor.constraint(equalTo: homeTeamLabel.centerXAnchor),
            homeBadgeImage.bottomAnchor.constraint(equalTo: homeTeamLabel.topAnchor, constant: -3),
            homeBadgeImage.heightAnchor.constraint(equalToConstant: 30),
            homeBadgeImage.widthAnchor.constraint(equalToConstant: 30),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            dateLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -3),
            
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            timeLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor, constant: -10),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            awayTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            awayTeamLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 10),
            awayTeamLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            awayTeamLabel.widthAnchor.constraint(equalToConstant: 120),
            
            awayBadgeImage.centerXAnchor.constraint(equalTo: awayTeamLabel.centerXAnchor),
            awayBadgeImage.bottomAnchor.constraint(equalTo: awayTeamLabel.topAnchor, constant: -3),
            awayBadgeImage.heightAnchor.constraint(equalToConstant: 30),
            awayBadgeImage.widthAnchor.constraint(equalToConstant: 30),
            
            
        ])
    }
    
    
}
