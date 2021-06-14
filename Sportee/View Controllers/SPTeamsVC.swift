//
//  SPTeamsVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPTeamsVC: SPDataLoadingVC {
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Team>!
    var teams: [Team] = []
    var players: [Player] = []
    var selectedTeam: Team!
    
    var isSelectedOnce = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        print(leagueID)
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isUserInteractionEnabled = false
        configureCollectionView()
        getTeams()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            tabBarController?.tabBar.isHidden = false
        }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        collectionView.isHidden = true
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SPTeamsCell.self, forCellWithReuseIdentifier: SPTeamsCell.reuseID)
        collectionView.delegate = self
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Team>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, team) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SPTeamsCell.reuseID, for: indexPath) as! SPTeamsCell
            cell.set(team: team)
            return cell
        })
    }
    
    func getTeams() {
        showLoadingView()
        NetworkManager.shared.getAllTeams(leagueid: LeagueID.nba) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let team):
                self.teams = team.teams
                self.updateData(on: self.teams)
                allTeam = self.teams
                self.downloadTeamBadgeImages(team: team.teams)
                self.downloadStadiumImages(team: team.teams)
                
                
            case .failure(let error):
                self.presentSPAlertOnMainThread(title: "Bad stuff happened.", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func getPlayersFromTeams(index: Int) {
        showLoadingView()
        let destVC = SPSingleTeamVC()
        NetworkManager.shared.getAllPlayersForSelectedTeam(teamID: self.teams[index].idTeam) { result in
            switch result {
            case .success(let player):
                self.players = player.player
                
                if playersTeamIdArray.contains(self.teams[index].idTeam) {
                    DispatchQueue.main.async {
                        
                        let destVC2 = SPTeamLast5EventsVC()
                        destVC2.teamID = self.teams[index].idTeam
                        destVC.team = self.teams[index]
                        destVC.title = self.teams[index].strTeam
                        destVC.teamID = self.teams[index].idTeam
                        self.dismissLoadingView()
                        self.navigationController?.navigationBar.isHidden = false
                    self.navigationController?.pushViewController(destVC, animated: true)


                    }
                } else {
                    self.downloadPlayersImages(player: player.player, destVC: destVC)
                    DispatchQueue.main.async {
                        let destVC2 = SPTeamLast5EventsVC()
                        destVC2.teamID = self.teams[index].idTeam
                        destVC.team = self.teams[index]
                        destVC.title = self.teams[index].strTeam
                        destVC.teamID = self.teams[index].idTeam
                       
                    }
                }

            case .failure(let error):
                self.presentSPAlertOnMainThread(title: "Bad stuff happened.", message: error.rawValue, buttonTitle: "Ok")
            }
        }
     
    }

    
    func updateData(on teams: [Team] ) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Team>()
        snapShot.appendSections([.main])
        snapShot.appendItems(teams)
        DispatchQueue.main.async { self.dataSource.apply(snapShot, animatingDifferences: true)}
        
    }
    
    func downloadTeamBadgeImages(team: [Team]) {
            for index in 0...teams.count - 1 {
                
                NetworkManager.shared.downloadImage(from: team[index].strTeamBadge) {  image in
                    guard let image = image else {return}
                        teamIDs.append(team[index].idTeam)
                    teamShortNamesArray.append(team[index].strTeamShort ?? "")
                        images.append(image)
                    self.createTeamIDImageDic()
                    
                }
                
            }
    }
    
    func downloadStadiumImages(team: [Team]) {
            for index in 0...teams.count - 1 {
                
                NetworkManager.shared.downloadImage(from: team[index].strStadiumThumb) {  image in
                    guard let image = image else {return}
                    stadiumIds.append(team[index].idTeam)
                    stadiumImages.append(image)
                    self.createTeamIDStadiumDic()
                    if index == team.count - 1 {
                        self.dismissLoadingView()
                        DispatchQueue.main.async {
                            self.tabBarController?.tabBar.isUserInteractionEnabled = true
                            self.collectionView.isHidden = false
                            
                        }
                    }
                }
            }
    }
    
    func downloadPlayersImages(player: [Player], destVC: UIViewController ) {
    
            for index in 0...players.count - 1 {
                NetworkManager.shared.downloadImage(from: (players[index].strCutout ?? players[index].strThumb) ?? "") {  image in
                    guard let image = image else {return}
                    playerDownloadedImages.append(image)
                    playersIDsArray.append(player[index].idPlayer ?? "")
                    playersTeamIdArray.append(player[index].idTeam ?? "")

                    if index == self.players.count - 1 {
                        self.dismissLoadingView()
                        DispatchQueue.main.async {
                                self.navigationController?.navigationBar.isHidden = false
                            self.navigationController?.pushViewController(destVC, animated: true)
                            
                        }
                    }
 
                }
            }
    }
    
    
    func createTeamIDImageDic() {
        for (index, element) in teamIDs.enumerated() {
            teamIDsImages[element] = images[index]
        }
        for (index, element) in teamIDs.enumerated() {
            teamIdShortNames[element] = teamShortNamesArray[index]
        }
        
    }
    
    func createTeamIDStadiumDic() {
        for (index, element) in stadiumIds.enumerated() {
            teamIDsStadiumImages[element] = stadiumImages[index]
        }
    }
}



extension SPTeamsVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        getPlayersFromTeams(index: indexPath.item)
        
    }
}
