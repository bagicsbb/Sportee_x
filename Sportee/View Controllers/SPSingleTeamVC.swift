//
//  SPSingleTeamVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPSingleTeamVC: SPDataLoadingVC {
    
    let teamLogoImage = SPTeamsImageView(frame: .zero)
    let teamBadgeImage = SPTeamsImageView(frame: .zero)
    let vc2 = UIViewController()
    let scrollview = UIScrollView()
    let container = UIView()
    let historyLabel = SPBodyLabel(textAlignment: .left)
    
    let playerListVC = SPPlayerListVC()
    let last5EventListVC = SPTeamLast5EventsVC()
    let next5EventListVC = SPTeamNext5EventsVC()
    let cardBackgroundView = SPCardBackgroundView()
    let smallCardBackgroundView = SPSmallCardBackgroundView(frame: .zero)

    
    var team: Team!
    var teamID: String!
    var player: [Player] = []
    var stadiumImage = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScrollView()
        
        configure()
        setTeamLogo(team: team)
        setTeamBadge(team: team)
        last5EventListVC.view.isHidden = true
        next5EventListVC.view.isHidden = true
        vc2.view.isHidden = true
        

    }
    
    func configure() {
       
        let detailsView = SPTeamDetailsView(establishedDetail: team.intFormedYear, stadiumDetail: team.strStadium, locationDetail: team.strStadiumLocation)
        let padding: CGFloat = 10
        let items = ["Playes","History", "Last Matches", "Next Matches"]
        let segmentedControl = UISegmentedControl(items: items)
        
        segmentedControl.setTitle("Players", forSegmentAt: 0)
        segmentedControl.setTitle("Stadium", forSegmentAt: 1)
        segmentedControl.setTitle("Last", forSegmentAt: 2)
        segmentedControl.setTitle("Next", forSegmentAt: 3)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentControl), for: .valueChanged)

        playerListVC.teamID = self.teamID
        last5EventListVC.teamID = self.teamID
        next5EventListVC.teamID = self.teamID
        
        addChild(playerListVC)
        playerListVC.didMove(toParent: self)
        
        addChild(vc2)
        vc2.didMove(toParent: self)
        vc2.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(last5EventListVC)
        last5EventListVC.didMove(toParent: self)
        last5EventListVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(next5EventListVC)
        next5EventListVC.didMove(toParent: self)
        next5EventListVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.bringSubviewToFront(playerListVC.view)
        
        smallCardBackgroundView.addSubviews(detailsView)
        
        view.addSubviews(teamLogoImage,cardBackgroundView, smallCardBackgroundView, teamBadgeImage, segmentedControl,vc2.view, last5EventListVC.view, next5EventListVC.view , playerListVC.view)
        

        playerListVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.becomeFirstResponder()

        NSLayoutConstraint.activate([
            
            cardBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cardBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            cardBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            cardBackgroundView.heightAnchor.constraint(equalToConstant: 300),
            
            teamLogoImage.topAnchor.constraint(equalTo: cardBackgroundView.topAnchor, constant: 20),
            teamLogoImage.leadingAnchor.constraint(equalTo: cardBackgroundView.leadingAnchor, constant: 20),
            teamLogoImage.trailingAnchor.constraint(equalTo: cardBackgroundView.trailingAnchor, constant: -20),
            teamLogoImage.heightAnchor.constraint(equalToConstant: 60),
            
            smallCardBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            smallCardBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            smallCardBackgroundView.heightAnchor.constraint(equalToConstant: (view.bounds.width/3) * 1.3),
            smallCardBackgroundView.topAnchor.constraint(equalTo: teamLogoImage.bottomAnchor, constant: 30),
            
            teamBadgeImage.centerYAnchor.constraint(equalTo: smallCardBackgroundView.centerYAnchor),
            teamBadgeImage.leadingAnchor.constraint(equalTo: smallCardBackgroundView.leadingAnchor, constant: 10),
            teamBadgeImage.widthAnchor.constraint(equalToConstant: (view.bounds.width/3) * 0.9),
            teamBadgeImage.heightAnchor.constraint(equalToConstant: (view.bounds.width/3) * 0.9),
            
            detailsView.bottomAnchor.constraint(equalTo: smallCardBackgroundView.bottomAnchor, constant: -15),
            detailsView.leadingAnchor.constraint(equalTo: teamBadgeImage.trailingAnchor, constant: 20),
            detailsView.trailingAnchor.constraint(equalTo: smallCardBackgroundView.trailingAnchor,  constant: -5),
            detailsView.topAnchor.constraint(equalTo: smallCardBackgroundView.topAnchor, constant: 5),
            
            segmentedControl.topAnchor.constraint(equalTo: cardBackgroundView.bottomAnchor, constant: 30),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            playerListVC.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding * 2),
            playerListVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            playerListVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            playerListVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           vc2.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding * 2),
           vc2.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           vc2.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
           vc2.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           last5EventListVC.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding * 2),
           last5EventListVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           last5EventListVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
           last5EventListVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           next5EventListVC.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: padding * 2),
           next5EventListVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           next5EventListVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
           next5EventListVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            container.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            container.heightAnchor.constraint(equalTo: historyLabel.heightAnchor, constant: 220),
            
            stadiumImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            stadiumImage.trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stadiumImage.heightAnchor.constraint(equalToConstant: 210),
            
           historyLabel.topAnchor.constraint(equalTo: stadiumImage.bottomAnchor, constant: 15),
           historyLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 3),
           historyLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -3),
           historyLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
        view.bringSubviewToFront(detailsView)
        view.bringSubviewToFront(smallCardBackgroundView)
        view.bringSubviewToFront(teamBadgeImage)
        view.bringSubviewToFront(teamLogoImage)
        
        cardBackgroundView.isHidden = true
        

    }
    func configureScrollView() {
        let fileteredStadiumDic = teamIDsStadiumImages.filter { $0.key == self.team.idTeam }
        stadiumImage.image = fileteredStadiumDic[self.team.idTeam]
        
        vc2.view.addSubview(scrollview)
        scrollview.pinToEdges(of: vc2.view)
        scrollview.addSubview(container)
        container.pinToEdges(of: scrollview)
        container.addSubview(historyLabel)
        stadiumImage.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(stadiumImage)
        container.backgroundColor = self.view.backgroundColor
        historyLabel.text = self.team.strStadiumDescription
        historyLabel.numberOfLines = 0
        historyLabel.textColor = .label
    }
    
    func setTeamLogo(team: Team) {
        
        NetworkManager.shared.downloadImage(from: team.strTeamLogo) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.teamLogoImage.image = image
               
            }
        }
    }
    func setTeamBadge(team:Team) {
        NetworkManager.shared.downloadImage(from: team.strTeamBadge) { [weak self] image in
            guard let self = self else {return}
            DispatchQueue.main.async {self.teamBadgeImage.image = image}
        }
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            playerListVC.view.isHidden = false
            vc2.view.isHidden = true
            last5EventListVC.view.isHidden = true
            next5EventListVC.view.isHidden = true
        case 1:
            playerListVC.view.isHidden = true
            vc2.view.isHidden = false
            last5EventListVC.view.isHidden = true
            next5EventListVC.view.isHidden = true
        case 2:
            last5EventListVC.view.isHidden = false
            playerListVC.view.isHidden = true
            vc2.view.isHidden = true
            next5EventListVC.view.isHidden = true
        case 3:
            next5EventListVC.view.isHidden = false
            last5EventListVC.view.isHidden = true
            playerListVC.view.isHidden = true
            vc2.view.isHidden = true
            
        default:
            break
        }
    }
}



