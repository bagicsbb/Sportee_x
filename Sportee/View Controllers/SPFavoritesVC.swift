//
//  SPFavoritesVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 11..
//

import UIKit

class SPFavoritesVC: SPDataLoadingVC {
    
    let tableview = UITableView()
    var player: [Player] = []
    let destVC = SPPDetailsVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        self.tabBarItem.title = "Favorites"
        self.navigationItem.title = "Dream Team ❤️"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.rowHeight = 80
        tableview.delegate = self
        tableview.dataSource = self
        tableview.removeExcessCell()
        
        tableview.register(SPFavoriteCell.self, forCellReuseIdentifier: SPFavoriteCell.reuseID)
    }
    
    
    func getFavorites() {
        PersistenceManager.retriveFavorites { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: "You don't have any favorite players yet.", in: self.view)
                } else {
                    self.player = favorites
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                        self.view.bringSubviewToFront(self.tableview)
                    }
                }
                
            case .failure(let error):
                self.presentSPAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
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


extension SPFavoritesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: SPFavoriteCell.reuseID) as! SPFavoriteCell
        let favorite = player[indexPath.row]
        cell.set(player: favorite)
        return cell
    }
    
    
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
        
        setDestVCColors(player: player[indexPath.row], contains: "Bask", lightBackgroundColor: BostonColors.lightBackground, darkBackgroundColor: .systemBackground, detailsBackground: .lightGray, detailsTextColor: .label, destVC: destVC)
        
        navigationController?.present(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        
        PersistenceManager.updateWidth(favorite: player[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else {return}
            guard let error = error else {

                self.player.remove(at: indexPath.row)
                self.tableview.deleteRows(at: [indexPath], with: .left)
                return
            }
            self.presentSPAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
