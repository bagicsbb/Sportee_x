//
//  SPEventsVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPEventsVC: SPDataLoadingVC {
    
    var tableview = UITableView()
    var event: [EventModel] = []
    var filteredEvents: [EventModel] = []
    let date = Date()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getEvents(date: formatDate(formattingDate: date))
        configureTableView()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = false
        self.tabBarItem.title = "Events"
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    
    func formatDate(formattingDate: Date) -> String{
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: formattingDate)
        return result
    }
    
    
    func getEvents(date: String) {
        showLoadingView()
        NetworkManager.shared.getEvents(dateOfDay: date, completed: { result in
            switch result {
            case .success(let event):
                self.event = event.events
                self.filteredEvents = self.event.filter { event in
                    return event.idLeague == "4387"
                }
                if self.filteredEvents.count == 0 {
                    self.presentSPAlertOnMainThread(title: "No matches.", message: "Please select another date.", buttonTitle: "Ok")
                }
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                        self.dismissLoadingView()
                    }
            case .failure(_):
                self.presentSPAlertOnMainThread(title: "No matches.", message: "Please select another date.", buttonTitle: "Ok")
                self.dismissLoadingView()
                return
            }
        })
    }
    
    func configureViewController() {
        let datePickerPresenter = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(datePickerPresenterTapped))
        navigationItem.rightBarButtonItem = datePickerPresenter
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    @objc func datePickerPresenterTapped() {
        let datePickerVC = SPDatePickerVC(nibName: nil, bundle: nil)
        datePickerVC.datePickerDelegate = self
        datePickerVC.preferredContentSize = CGSize(width: ScreenSize.width, height: 500)
        present(datePickerVC, animated: true)
    }
    

    

    
    func configureTableView() {
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.rowHeight = 140
        tableview.dataSource = self
        tableview.backgroundColor = .systemBackground
        tableview.register(SPEventsOnASpecificDayCell.self, forCellReuseIdentifier: SPEventsOnASpecificDayCell.reuseID)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.removeExcessCell()
        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        
        view.bringSubviewToFront(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }

    
}

extension SPEventsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: SPEventsOnASpecificDayCell.reuseID) as!  SPEventsOnASpecificDayCell
        cell.set(event: filteredEvents[indexPath.row])
        return cell
        
    }

}

extension SPEventsVC: DatePickerCVDelegate {
    func didDatePicked(for date: Date) {
        let datepickerVC = SPDatePickerVC(nibName: nil, bundle: nil)
        datepickerVC.datePickerDelegate = self
        let newDate = formatDate(formattingDate: date)
        print(newDate)
        getEvents(date: newDate)
        self.navigationItem.title = formatDate(formattingDate: date)
        
    }
    
    
}
