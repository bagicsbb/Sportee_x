//
//  SPPlayersVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPSearchPlayerVC: UIViewController {

    let logoImageView = UIImageView()
    let playerName = SPSearchTextfield()
    let callToActionButton = SPButton1(backgroundColor: .lightGray, title: "Show the player")
    var logoImageViewTopConstraint: NSLayoutConstraint!
    
    var isPlayerNameEntered : Bool { return !playerName.text!.isEmpty }
    var players:[Player] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, playerName, callToActionButton)
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDissmissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playerName.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func createDissmissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushSPPDetailsVC() {
        let detailsVC = SPPDetailsVC(nibName: nil, bundle: nil)
        guard isPlayerNameEntered else {
            presentSPAlertOnMainThread(title: "Empty Name", message: "Please enter a name, We need to know who to look for 😀.", buttonTitle: "Ok")
            return
        }
        playerName.resignFirstResponder()
        
        NetworkManager.shared.getThePlayerBySearch(name: (playerName.text?.replacingOccurrences(of: " ", with: "%20"))!) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let player):
                self.players = player.player
                DispatchQueue.main.async {
                    self.filterPlayer(detailsVC: detailsVC)
                }
            case .failure(let error):
                print(error.rawValue)
                self.presentSPAlertOnMainThread(title: "Wrong Name", message: "No basketball player with this name", buttonTitle: "Ok")
                DispatchQueue.main.async {
                    self.playerName.text = ""
                }
                
            }
        }

    }
    
    
    func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "sportee_logo")

        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: view.bounds.width),
            logoImageView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    func configureTextField() {
        playerName.delegate = self
        
        
        NSLayoutConstraint.activate([
            playerName.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            playerName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            playerName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            playerName.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func configureCallToActionButton() {
        callToActionButton.addTarget(self, action: #selector(pushSPPDetailsVC), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func filterPlayer(detailsVC: SPPDetailsVC) {
        let filteredPlayers = self.players.filter { player in
            return player.strSport == "Basketball"
        }
        
        if filteredPlayers.count != 0 {
            detailsVC.favoriteButton.isHidden = true
            detailsVC.player = filteredPlayers.first
            detailsVC.name = filteredPlayers.first?.strPlayer
            detailsVC.position = filteredPlayers.first?.strPosition
            detailsVC.playerDescription = filteredPlayers.first?.strDescriptionEN
            detailsVC.team = filteredPlayers.first?.strTeam?.replacingOccurrences(of: "_Retired Basketball", with: "Retired")
            
            if self.traitCollection.userInterfaceStyle == .light {
                detailsVC.headerColorView.backgroundColor = .lightGray
                detailsVC.playerImageView.layer.borderColor = UIColor.lightGray.cgColor
            } else {
                detailsVC.headerColorView.backgroundColor = .darkGray
                detailsVC.playerImageView.layer.borderColor = UIColor.lightGray.cgColor
            }
            
            self.present(detailsVC, animated: true, completion: nil)
        } else {
            self.presentSPAlertOnMainThread(title: "Wrong Name", message: "No basketball player with this name", buttonTitle: "Ok")
        }

        self.playerName.text = ""
    }
}

extension SPSearchPlayerVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushSPPDetailsVC()
        
        return true
    }


}
