//
//  SPEventCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 20..
//

import UIKit

class SPLast5EventCell: UITableViewCell {
    
    static let reuseID = "EventCell"
    var homeTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 14)
    var awayTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 14)
    var homeResult = SPResultLabel(textAlignment: .center, fontSize: 30)
    var awayResult = SPResultLabel(textAlignment: .center, fontSize: 30)
    var dateLabel = SPBodyLabel(textAlignment: .center)
    var homeBadgeImage = UIImageView(frame: .zero)
    var awayBadgeImage = UIImageView(frame: .zero)
    let separator = UILabel()
    
    
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

    
    func set(event: Last5EventModel) {
        homeTeamLabel.text = event.strHomeTeam
        awayTeamLabel.text = event.strAwayTeam
        homeResult.text = event.intHomeScore
        awayResult.text = event.intAwayScore
        dateLabel.text = event.dateEvent
        
        
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        
        separator.text = ":"
        separator.textColor = .label
        
        let fileteredHomeDictionary = teamIDsImages.filter { $0.key == event.idHomeTeam }
        let filteredAwayDictionary = teamIDsImages.filter { $0.key == event.idAwayTeam }
        let intHomeResult = (event.intHomeScore as NSString? ?? "0" as NSString).integerValue
        let intAwayResult = (event.intAwayScore as NSString? ?? "0"  as NSString).integerValue
        
        homeBadgeImage.image = fileteredHomeDictionary[event.idHomeTeam!]
        awayBadgeImage.image = filteredAwayDictionary[event.idAwayTeam!]
        
        if intHomeResult > intAwayResult {
            
            awayResult.font = UIFont.systemFont(ofSize: 30, weight: .light)
        } else {
            homeResult.font = UIFont.systemFont(ofSize: 30, weight: .light)
        }
        
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        awayResult.translatesAutoresizingMaskIntoConstraints = false
        homeResult.translatesAutoresizingMaskIntoConstraints = false
        awayResult.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        homeBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        awayBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(homeTeamLabel,awayTeamLabel, homeResult, awayResult, dateLabel , separator, homeBadgeImage, awayBadgeImage)
        
   
        let padding: CGFloat = 3
        
        NSLayoutConstraint.activate([
            
            homeTeamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 60),
            homeTeamLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            homeTeamLabel.heightAnchor.constraint(equalToConstant: 50),
            homeTeamLabel.widthAnchor.constraint(equalToConstant: 100),
            
            homeBadgeImage.centerXAnchor.constraint(equalTo: homeTeamLabel.centerXAnchor),
            homeBadgeImage.bottomAnchor.constraint(equalTo: homeTeamLabel.topAnchor, constant: -3),
            homeBadgeImage.heightAnchor.constraint(equalToConstant: 30),
            homeBadgeImage.widthAnchor.constraint(equalToConstant: 30),
            
            homeResult.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 40),
            homeResult.leadingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor, constant: 8),
            homeResult.heightAnchor.constraint(equalToConstant: 60),
            homeResult.widthAnchor.constraint(equalToConstant: 60),
            
            separator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 40),
            separator.leadingAnchor.constraint(equalTo: homeResult.trailingAnchor, constant: padding),
            separator.trailingAnchor.constraint(equalTo: awayResult.leadingAnchor, constant: -padding),
            
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            dateLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -10),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            
            awayResult.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 40),
            awayResult.trailingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor, constant: -padding),
            awayResult.heightAnchor.constraint(equalToConstant: 70),
            awayResult.widthAnchor.constraint(equalToConstant: 70),
            
            awayTeamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 60),
            awayTeamLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            awayTeamLabel.heightAnchor.constraint(equalToConstant: 50),
            awayTeamLabel.widthAnchor.constraint(equalToConstant: 100),
            
            awayBadgeImage.centerXAnchor.constraint(equalTo: awayTeamLabel.centerXAnchor),
            awayBadgeImage.bottomAnchor.constraint(equalTo: awayTeamLabel.topAnchor, constant: -3),
            awayBadgeImage.heightAnchor.constraint(equalToConstant: 30),
            awayBadgeImage.widthAnchor.constraint(equalToConstant: 30),
            
            
        ])
    }
    
    
}
