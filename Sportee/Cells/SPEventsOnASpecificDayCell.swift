//
//  SPEventsOnASpecificDayCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 31..
//

import UIKit

class SPEventsOnASpecificDayCell: UITableViewCell {
    
    static let reuseID = "eventCell"
    var homeBadgeImage = UIImageView(frame: .zero)
    var awayBadgeImage = UIImageView(frame: .zero)
    var homeTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 16)
    var awayTeamLabel = SPTitleLabel(textAlignment: .center, fontSize: 16)
    var homeScore = SPTitleLabel(textAlignment: .center, fontSize: 35)
    var awayScore = SPTitleLabel(textAlignment: .center, fontSize: 35)
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
    
    func set(event: EventModel) {
        dateLabel.text = event.dateEvent
        timeLabel.text = event.strTime
        homeScore.text = event.intHomeScore
        awayScore.text = event.intAwayScore
        self.backgroundColor = .systemBackground
      
        dateLabel.font = UIFont.systemFont(ofSize: 9)
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        
        if event.intHomeScore == nil {
            homeScore.text = "-.-"
            awayScore.text = "-.-"
        }

        let fileteredHomeDictionary = teamIDsImages.filter { $0.key == event.idHomeTeam }
        let filteredAwayDictionary = teamIDsImages.filter { $0.key == event.idAwayTeam }
        
        
        let filteredHomeShortNameDictionary = teamIdShortNames.filter { $0.key == event.idHomeTeam }
        let filteredAwayShortNameDictionary = teamIdShortNames.filter { $0.key == event.idAwayTeam }

        homeBadgeImage.image = fileteredHomeDictionary[event.idHomeTeam!]
        awayBadgeImage.image = filteredAwayDictionary[event.idAwayTeam!]
        homeTeamLabel.text = filteredHomeShortNameDictionary[event.idHomeTeam!]
        awayTeamLabel.text = filteredAwayShortNameDictionary[event.idAwayTeam!]
        
    }
    
    func configure() {
            
        addSubviews(homeTeamLabel, awayTeamLabel, dateLabel, timeLabel, homeBadgeImage, awayBadgeImage, awayScore, homeScore )
        homeBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        awayBadgeImage.translatesAutoresizingMaskIntoConstraints = false
        homeBadgeImage.contentMode = .scaleAspectFit
        awayBadgeImage.contentMode = .scaleAspectFit
    

        NSLayoutConstraint.activate([

            homeTeamLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            homeTeamLabel.centerXAnchor.constraint(equalTo: homeBadgeImage.centerXAnchor),
            homeTeamLabel.widthAnchor.constraint(equalToConstant: 100),
            homeTeamLabel.bottomAnchor.constraint(equalTo: homeBadgeImage.topAnchor, constant: -5),
            
            awayTeamLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            awayTeamLabel.widthAnchor.constraint(equalToConstant: 100),
            awayTeamLabel.centerXAnchor.constraint(equalTo: awayBadgeImage.centerXAnchor),
            awayTeamLabel.bottomAnchor.constraint(equalTo: homeBadgeImage.topAnchor, constant: -5),
            
            homeBadgeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            homeBadgeImage.widthAnchor.constraint(equalToConstant: 70),
            homeBadgeImage.heightAnchor.constraint(equalToConstant: 70),
            
            awayBadgeImage.centerYAnchor.constraint(equalTo: homeBadgeImage.centerYAnchor),
            awayBadgeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            awayBadgeImage.widthAnchor.constraint(equalToConstant: 70),
            awayBadgeImage.heightAnchor.constraint(equalToConstant: 70),
            
            awayScore.trailingAnchor.constraint(equalTo: awayBadgeImage.leadingAnchor, constant: -10),
            awayScore.centerYAnchor.constraint(equalTo: awayBadgeImage.centerYAnchor),
            awayScore.widthAnchor.constraint(equalToConstant: 90),
            awayScore.heightAnchor.constraint(equalToConstant: 40),
            
            homeScore.leadingAnchor.constraint(equalTo: homeBadgeImage.trailingAnchor, constant: 10),
            homeScore.centerYAnchor.constraint(equalTo: awayScore.centerYAnchor),
            homeScore.widthAnchor.constraint(equalToConstant: 90),
            homeScore.heightAnchor.constraint(equalToConstant: 40),
            
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -3),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3),
            timeLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.leadingAnchor, constant: 5),
            timeLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.trailingAnchor, constant: -5),
            timeLabel.bottomAnchor.constraint(equalTo: homeBadgeImage.topAnchor, constant: -10),
            
        ])
    }

}
