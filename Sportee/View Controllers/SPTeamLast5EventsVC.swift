//
//  SPTeamEventsVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 19..
//

import UIKit

class SPTeamLast5EventsVC: UIViewController {
    
    
    let tableview = UITableView()
    var events: [Last5EventModel] = []
    var teamID: String!
    var teamImages: [UIImage] = []
    var teamIDArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        configure()
        getEvents()


    }
    
    func configure() {
        tabBarController?.tabBar.isHidden = true
        view.addSubview(tableview)
        tableview.frame = view.bounds
        tableview.rowHeight = 120
        tableview.dataSource = self
        tableview.backgroundColor = .systemBackground
        tableview.register(SPLast5EventCell.self, forCellReuseIdentifier: SPLast5EventCell.reuseID)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.removeExcessCell()
        tableview.allowsSelection = false
        
        view.bringSubviewToFront(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func getEvents() {
        
        NetworkManager.shared.getLastEvents(teamID: self.teamID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let event):
                self.events = event.results
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            case .failure(let error):
                self.presentSPAlertOnMainThread(title: "Bad happened.", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }

}

extension SPTeamLast5EventsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: SPLast5EventCell.reuseID) as!  SPLast5EventCell
        cell.set(event: self.events[indexPath.row])
        return cell
    }

}

