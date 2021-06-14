//
//  SPPDetailsVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPPDetailsVC: UIViewController {
    
    let playerNameLabel = SPTitleLabel(textAlignment: .center, fontSize: 22)
    
    let positionLabel = SPBodyLabel(textAlignment: .center)
    let teamLabel = SPBodyLabel(textAlignment: .center)
    let xButton = XButton()
    let favoriteButton = FavoriteButton()
    
    var detailsViewBackground: UIColor!
    var attributeTextColor: UIColor!
    var detailsTextColor: UIColor!

    let headerColorView = UIView()
    let scrollview = UIScrollView()
    let playerDescriptionLabel = SPBodyLabel(textAlignment: .left)
    let container = UIView()
    
    var name: String!
    var position: String!
    var nationality: String!
    var team: String!
    var height: String!
    var weight: String!
    var playerDescription: String!
    
    var playerImageView = SPPlayerInfoImageView(frame: .zero)
    var player: Player!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureView()
        configureScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configurePlayerImage(player: player)
        configureScrollView()
    }
    
    
    func configurePlayerImage(player: Player) {
        
        NetworkManager.shared.downloadImage(from: player.strCutout ?? player.strThumb ?? "") { image in
            DispatchQueue.main.async {
                self.playerImageView.image = image
                self.configureView()
            }
        }
    }
    
    
    func configureView() {
        
        let heightDetails = SPPlayerDetailsView(attributeText: "Height", detailsText: self.player.strHeight ?? "")
        heightDetails.detailsText.textColor = self.detailsTextColor
        
        let weightDetails = SPPlayerDetailsView(attributeText: "Weight", detailsText: self.player.strWeight ??  "")
        weightDetails.detailsText.textColor = self.detailsTextColor
        
        let bornLabel = SPBodyLabel(textAlignment: .center)
        bornLabel.textColor = .lightText
        bornLabel.translatesAutoresizingMaskIntoConstraints = false
        bornLabel.text = self.player.dateBorn
        bornLabel.font = bornLabel.font.withSize(10)
        
        
        view.addSubviews(playerImageView, playerNameLabel, teamLabel, positionLabel, headerColorView, scrollview, heightDetails, weightDetails, bornLabel, xButton, favoriteButton)
        
        headerColorView.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        configureHeader()
        
        teamLabel.text = self.team
        teamLabel.textColor = .lightText
        teamLabel.font = UIFont.systemFont(ofSize: 16)
        playerNameLabel.text = self.name
        positionLabel.text = self.position
        positionLabel.textColor = .lightText
        
        xButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        

        NSLayoutConstraint.activate([
            
            playerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            playerImageView.heightAnchor.constraint(equalToConstant: 200),
            playerImageView.widthAnchor.constraint(equalToConstant: 200),

            playerNameLabel.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 5),
            playerNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            playerNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            playerNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            teamLabel.topAnchor.constraint(equalTo: playerNameLabel.lastBaselineAnchor, constant: 3),
            teamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            teamLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            teamLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bornLabel.topAnchor.constraint(equalTo: teamLabel.lastBaselineAnchor, constant: 8),
            bornLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bornLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bornLabel.heightAnchor.constraint(equalToConstant: 15),
            
            positionLabel.topAnchor.constraint(equalTo: bornLabel.lastBaselineAnchor, constant: 3),
            positionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            positionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            positionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            headerColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerColorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            headerColorView.heightAnchor.constraint(equalToConstant: 400),
            
            heightDetails.widthAnchor.constraint(equalToConstant: 100),
            heightDetails.heightAnchor.constraint(equalToConstant: 60),
            heightDetails.leadingAnchor.constraint(equalTo: headerColorView.leadingAnchor, constant: 3),
            heightDetails.bottomAnchor.constraint(equalTo: headerColorView.bottomAnchor, constant: -30),
            
           weightDetails.widthAnchor.constraint(equalToConstant: 100),
           weightDetails.heightAnchor.constraint(equalToConstant: 60),
           weightDetails.trailingAnchor.constraint(equalTo: headerColorView.trailingAnchor, constant: -3),
           weightDetails.bottomAnchor.constraint(equalTo: headerColorView.bottomAnchor, constant: -30),
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollview.topAnchor.constraint(equalTo: headerColorView.bottomAnchor, constant: 10),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            xButton.topAnchor.constraint(equalTo: headerColorView.topAnchor, constant: 10),
            xButton.trailingAnchor.constraint(equalTo: headerColorView.trailingAnchor, constant: -10),
            xButton.heightAnchor.constraint(equalToConstant: 25),
            xButton.widthAnchor.constraint(equalToConstant: 20),
            
            favoriteButton.topAnchor.constraint(equalTo: headerColorView.topAnchor, constant: 10),
            favoriteButton.leadingAnchor.constraint(equalTo: headerColorView.leadingAnchor, constant: 10),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
        ])
        
        view.bringSubviewToFront(playerImageView)
        view.bringSubviewToFront(playerNameLabel)
        view.bringSubviewToFront(positionLabel)
        view.bringSubviewToFront(teamLabel)
        view.bringSubviewToFront(heightDetails)
        view.bringSubviewToFront(weightDetails)
        view.bringSubviewToFront(bornLabel)
        view.bringSubviewToFront(xButton)
    }
    
    func configureHeader() {
        headerColorView.layer.cornerRadius = 10
        headerColorView.translatesAutoresizingMaskIntoConstraints = false

        headerColorView.layer.shadowColor = UIColor.black.cgColor

        headerColorView.layer.shadowOffset = .zero
        headerColorView.layer.shadowOpacity = 20
        headerColorView.layer.shadowRadius = 5
        headerColorView.layer.shadowPath = UIBezierPath(rect: headerColorView.bounds).cgPath
        headerColorView.layer.shouldRasterize = true
        headerColorView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func configureScrollView() {

       scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = view.backgroundColor
        container.translatesAutoresizingMaskIntoConstraints = false
        scrollview.addSubview(container)
        container.pinToEdges(of: scrollview)
        container.addSubview(playerDescriptionLabel)
        container.backgroundColor = view.backgroundColor
        container.bringSubviewToFront(playerDescriptionLabel)

        NSLayoutConstraint.activate([
            
            container.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            container.heightAnchor.constraint(equalTo: playerDescriptionLabel.heightAnchor, constant: 40),

            playerDescriptionLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            playerDescriptionLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 3),
            playerDescriptionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -3),
            
        ])
        
        playerDescriptionLabel.text = self.playerDescription
        playerDescriptionLabel.numberOfLines = 0
    }
    
    @objc func buttonAction () {
        dismiss(animated: true)
    }
    
    @objc func addFavorite() {
        print("favorite")
        
        PersistenceManager.updateWidth(favorite: player, actionType: .add) { [weak self] error in
            guard let self = self else {return}
            guard let error = error else {
                self.presentSPAlertOnMainThread(title: "Success!", message: "You have successfully favorited this user 🎊🎉", buttonTitle: "Hooray!")
                return
            }
            self.presentSPAlertOnMainThread(title: "Something went wrong.", message: error.rawValue, buttonTitle: "Ok")
        }
        
    }
    
}
