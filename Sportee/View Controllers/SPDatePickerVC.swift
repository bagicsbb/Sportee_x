//
//  SPDatePickerVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 31..
//

import UIKit

protocol DatePickerCVDelegate {
    func didDatePicked(for date: Date)
}

class SPDatePickerVC: UIViewController {
    
    let contanierView = SPInfoContainerView()
    let titleLabel    = SPTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel  = SPBodyLabel(textAlignment: .center)
    let actionButton  = SPButton1(backgroundColor: .tertiaryLabel, title: "Ok")
    let datePicker = UIDatePicker(frame: .zero)
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    var date = Date()
    let padding: CGFloat = 20
    var datePickerDelegate: DatePickerCVDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(contanierView, titleLabel, actionButton, messageLabel, datePicker)
        configureContainerView()
        configureTitleLabel()
        configureDatePicker()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            contanierView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contanierView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contanierView.widthAnchor.constraint(equalToConstant: 320),
            contanierView.heightAnchor.constraint(equalToConstant: 360),
        
        ])
    }
    
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Matches on a specific date."
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contanierView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(didDatePicked), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: contanierView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureMessageLabel() {
        messageLabel.text = message ?? "Select a date for matches."
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            messageLabel.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date(timeIntervalSince1970: -2)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        
        NSLayoutConstraint.activate([
            datePicker.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -8),
            datePicker.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
            
        ])
    }
    
    @objc func didDatePicked() {
        datePickerDelegate?.didDatePicked(for: datePicker.date)
        print(datePicker.date)
        dismiss(animated: true)
    }
}
