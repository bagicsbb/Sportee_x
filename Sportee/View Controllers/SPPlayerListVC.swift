//
//  FirstVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPPlayerListVC: SPDataLoadingVC {
    
    let tableview = UITableView()
    let destVC = SPPDetailsVC()
    
    var player: [Player] = []
    var teamID: String?
    var playerImages: [String] = []
    var playerUIImages: [UIImage] = []

    
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getPlayersFromTeams()
        configure()
    }
    
    func configure() {
        tabBarController?.tabBar.isHidden = true
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.rowHeight = 80
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .systemBackground
        tableview.register(SPPlayercell.self, forCellReuseIdentifier: SPPlayercell.reuseID)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.removeExcessCell()
        
        view.bringSubviewToFront(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getPlayersFromTeams() {
        showLoadingView()
        NetworkManager.shared.getAllPlayersForSelectedTeam(teamID: teamID!) { result in
            switch result {
            case .success(let player):
                self.player = player.player
                self.reloadData()
            case .failure(let error):
                self.presentSPAlertOnMainThread(title: "Bad stuff happened.", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
            self.dismissLoadingView()
        }
    }
}

extension SPPlayerListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.player.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: SPPlayercell.reuseID) as!  SPPlayercell
        let selectedPlayer = self.player[indexPath.row]
            cell.set(player: selectedPlayer)

        return cell
    }
    
    func setDestVCColors(player: Player, contains: String, lightBackgroundColor: UIColor, darkBackgroundColor: UIColor, detailsBackground: UIColor, detailsTextColor: UIColor, destVC: SPPDetailsVC) {
        if player.strTeam!.contains(contains) {
            destVC.playerImageView.backgroundColor = BostonColors.lightBackground
            destVC.playerImageView.layer.borderColor = UIColor.lightText.cgColor
            destVC.headerColorView.backgroundColor = detailsBackground
            destVC.playerNameLabel.textColor = .white
            destVC.detailsTextColor = detailsTextColor
            if traitCollection.userInterfaceStyle == .dark {
                destVC.view.backgroundColor = darkBackgroundColor
            } else {
                destVC.view.backgroundColor = lightBackgroundColor
            }
        }
    }
    
}

extension SPPlayerListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        destVC.player = player[indexPath.row]
        destVC.name = player[indexPath.row].strPlayer
        destVC.team = player[indexPath.row].strTeam
        destVC.nationality = player[indexPath.row].strNationality
        destVC.position = player[indexPath.row].strPosition
        destVC.height = player[indexPath.row].strHeight
        destVC.weight = player[indexPath.row].strWeight
        destVC.team = player[indexPath.row].strTeam
        destVC.playerDescription = player[indexPath.row].strDescriptionEN
        
        setDestVCColors(player: player[indexPath.row], contains: "Bos", lightBackgroundColor: BostonColors.lightBackground, darkBackgroundColor: BostonColors.darkBackround, detailsBackground: BostonColors.detailsBackground, detailsTextColor: BostonColors.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Atl", lightBackgroundColor: AtlantaHawks.lightBackground, darkBackgroundColor: AtlantaHawks.darkBackround, detailsBackground: AtlantaHawks.detailsBackground, detailsTextColor: AtlantaHawks.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Phi", lightBackgroundColor: Sixers.lightBackground, darkBackgroundColor: Sixers.darkBackround, detailsBackground: Sixers.detailsBackground, detailsTextColor: Sixers.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Broo", lightBackgroundColor: Brooklyn.lightBackground, darkBackgroundColor: Brooklyn.darkBackround, detailsBackground: Brooklyn.detailsBackground, detailsTextColor: Brooklyn.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Char", lightBackgroundColor: Charlotte.lightBackground, darkBackgroundColor: Charlotte.darkBackround, detailsBackground: Charlotte.detailsBackground, detailsTextColor: Charlotte.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Chi", lightBackgroundColor: ChichagoBulls.lightBackground, darkBackgroundColor: ChichagoBulls.darkBackround, detailsBackground: ChichagoBulls.detailsBackground, detailsTextColor: ChichagoBulls.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Clev", lightBackgroundColor: Cleveland.lightBackground, darkBackgroundColor: Cleveland.darkBackround, detailsBackground: Cleveland.detailsBackground, detailsTextColor: Cleveland.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Mave", lightBackgroundColor: Dallas.lightBackground, darkBackgroundColor: Dallas.darkBackround, detailsBackground: Dallas.detailsBackground, detailsTextColor: Dallas.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Denv", lightBackgroundColor: Denver.lightBackground, darkBackgroundColor: Denver.darkBackround, detailsBackground: Denver.detailsBackground, detailsTextColor: Denver.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Detr", lightBackgroundColor: .white, darkBackgroundColor: Detroit.darkBackround, detailsBackground: Detroit.detailsBackground, detailsTextColor: Detroit.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Hou", lightBackgroundColor: HoustonRockets.lightBackground, darkBackgroundColor: HoustonRockets.darkBackround, detailsBackground: HoustonRockets.detailsBackground, detailsTextColor: HoustonRockets.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Gold", lightBackgroundColor: GoldenState.lightBackground, darkBackgroundColor: GoldenState.darkBackround, detailsBackground: GoldenState.detailsBackground, detailsTextColor: GoldenState.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Ind", lightBackgroundColor: Indiana.lightBackground, darkBackgroundColor: Indiana.darkBackround, detailsBackground: Indiana.detailsBackground, detailsTextColor: Indiana.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Clip", lightBackgroundColor: LAClippers.lightBackground, darkBackgroundColor: LAClippers.darkBackround, detailsBackground: LAClippers.detailsBackground, detailsTextColor: LAClippers.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Lak", lightBackgroundColor: LALakers.lightBackground, darkBackgroundColor: LALakers.darkBackround, detailsBackground: LALakers.detailsBackground, detailsTextColor: LALakers.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Mem", lightBackgroundColor: Memphis.lightBackground, darkBackgroundColor: Memphis.darkBackround, detailsBackground: Memphis.detailsBackground, detailsTextColor: Memphis.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Mia", lightBackgroundColor: Miami.lightBackground, darkBackgroundColor: Miami.darkBackround, detailsBackground: Miami.detailsBackground, detailsTextColor: Miami.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Mil", lightBackgroundColor: Milwaukee.lightBackground, darkBackgroundColor: Milwaukee.darkBackround, detailsBackground: Milwaukee.detailsBackground, detailsTextColor: Milwaukee.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Minn", lightBackgroundColor: Minnesota.lightBackground, darkBackgroundColor: Minnesota.darkBackround, detailsBackground: Minnesota.detailsBackground, detailsTextColor: Minnesota.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Orlean", lightBackgroundColor: NewOrleans.lightBackground, darkBackgroundColor: NewOrleans.darkBackround, detailsBackground: NewOrleans.detailsBackground, detailsTextColor: NewOrleans.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Kni", lightBackgroundColor: NewYorkKnicks.lightBackground, darkBackgroundColor: NewYorkKnicks.darkBackround, detailsBackground: NewYorkKnicks.detailsBackground, detailsTextColor: NewYorkKnicks.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Okl", lightBackgroundColor: OKC.lightBackground, darkBackgroundColor: OKC.darkBackround, detailsBackground: OKC.detailsBackground, detailsTextColor: OKC.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Orla", lightBackgroundColor: Orlando.lightBackground, darkBackgroundColor: Orlando.darkBackround, detailsBackground: Orlando.detailsBackground, detailsTextColor: Orlando.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Pho", lightBackgroundColor: Phoenix.lightBackground, darkBackgroundColor: Phoenix.darkBackround, detailsBackground: Phoenix.detailsBackground, detailsTextColor: Phoenix.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Port", lightBackgroundColor: Portland.lightBackground, darkBackgroundColor: Portland.darkBackround, detailsBackground: Portland.detailsBackground, detailsTextColor: Portland.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Sac", lightBackgroundColor: Sacramento.lightBackground, darkBackgroundColor: Sacramento.darkBackround, detailsBackground: Sacramento.detailsBackground, detailsTextColor: Sacramento.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Anto", lightBackgroundColor: SanAntonio.lightBackground, darkBackgroundColor: SanAntonio.darkBackround, detailsBackground: SanAntonio.detailsBackground, detailsTextColor: SanAntonio.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Tor", lightBackgroundColor: Toronto.lightBackground, darkBackgroundColor: Toronto.darkBackround, detailsBackground: Toronto.detailsBackground, detailsTextColor: Toronto.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Uta", lightBackgroundColor: UtahJazz.lightBackground, darkBackgroundColor: UtahJazz.darkBackround, detailsBackground: UtahJazz.detailsBackground, detailsTextColor: UtahJazz.details, destVC: destVC)
        
        setDestVCColors(player: player[indexPath.row], contains: "Was", lightBackgroundColor: Washington.lightBackground, darkBackgroundColor: Washington.darkBackround, detailsBackground: Washington.detailsBackground, detailsTextColor: Washington.details, destVC: destVC)

        navigationController?.present(destVC, animated: true)
    }
    
    
}

