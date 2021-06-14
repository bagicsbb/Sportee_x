//
//  SPTeamNext5EventsVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 25..
//

import UIKit

class SPTeamNext5EventsVC: UIViewController {
    
    
    let tableview = UITableView()
    var events: [Next5EventModel] = []
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
        tableview.register(SPNext5EventCell.self, forCellReuseIdentifier: SPNext5EventCell.reuseID)
        tableview.register(SPNoMatchesCell.self, forCellReuseIdentifier: SPNoMatchesCell.reuseID)
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
    
    func getEvents() {
        
        NetworkManager.shared.getNextEvents(teamID: self.teamID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let event):
                self.events = event.events
                print(event.events.count)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }

}

extension SPTeamNext5EventsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if events.count == 0 {
            return 1
        } else {
            return events.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if events.count == 0 {
            self.tableview.rowHeight = 110
            let cell = tableview.dequeueReusableCell(withIdentifier: SPNoMatchesCell.reuseID) as! SPNoMatchesCell
            return cell
        } else {
            let cell = tableview.dequeueReusableCell(withIdentifier: SPNext5EventCell.reuseID) as!  SPNext5EventCell
            cell.set(event: self.events[indexPath.row])
            return cell
        }

    }

}

