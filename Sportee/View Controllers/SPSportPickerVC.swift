//
//  SportPickerVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit


class SPSportPickerVC: UIViewController {
    
    let nbaButton = SPButton1(backgroundColor: .white, title: "")
    let sportImage = UIImageView()
    let infoLabel = SPBodyLabel(textAlignment: .center)
    let moreSportLabel = SPBodyLabel(textAlignment: .center)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: "Sports", image:  UIImage(systemName: "house"), selectedImage: UIImage(systemName: "sportscourt.fill"))
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        configureView()
        configureButton()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    @objc func goToNBA(sender: UIButton) {
        sender.showAnimation {
            leagueID = LeagueID.nba
            self.tabBarController?.selectedIndex = 1
        }
    }
    
    
    func configureButton() {
        nbaButton.addTarget(self, action: #selector(goToNBA) , for: .touchUpInside)
        nbaButton.titleLabel?.textAlignment = .right
        
        if traitCollection.userInterfaceStyle == .dark {
            nbaButton.set(backgroundColor: .white, title: "")
        } else {
            nbaButton.layer.borderWidth = 2
            nbaButton.layer.borderColor = UIColor.black.cgColor
        }
        
        let nbaButtonImageView = UIImageView()
        nbaButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        nbaButtonImageView.image = UIImage(named: "nba_logo")
        
        
        
        nbaButton.addSubviews(nbaButtonImageView)

        NSLayoutConstraint.activate([
            
            sportImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sportImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sportImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sportImage.heightAnchor.constraint(equalToConstant: 750),
            
            infoLabel.bottomAnchor.constraint(equalTo: nbaButton.topAnchor, constant: -15),
            infoLabel.centerXAnchor.constraint(equalTo: nbaButton.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalToConstant: 200),
            infoLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            nbaButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            nbaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nbaButton.widthAnchor.constraint(equalToConstant: 150),
            nbaButton.heightAnchor.constraint(equalToConstant: 60),
            
            
            nbaButtonImageView.centerXAnchor.constraint(equalTo: nbaButton.centerXAnchor),
            nbaButtonImageView.centerYAnchor.constraint(equalTo: nbaButton.centerYAnchor),
            nbaButtonImageView.heightAnchor.constraint(equalToConstant: 50),
            nbaButtonImageView.widthAnchor.constraint(equalToConstant: 70),
            
            moreSportLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            moreSportLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            moreSportLabel.widthAnchor.constraint(equalToConstant: 200),
            moreSportLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }

    func configureView()  {
        view.addSubviews(sportImage, nbaButton, infoLabel, moreSportLabel)
        view.backgroundColor = .systemBackground
        sportImage.translatesAutoresizingMaskIntoConstraints = false
        sportImage.image = UIImage(named: "sportpicker_background")
        infoLabel.text = "Select a Sport:"
        moreSportLabel.text = "...more sports coming soon."
        moreSportLabel.font = UIFont.systemFont(ofSize: 12)
        
    }
    
}
