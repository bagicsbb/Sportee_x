//
//  SPAlertVC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPAlertVC: UIViewController {
    
    let contanierView = SPInfoContainerView()
    let titleLabel    = SPTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel  = SPBodyLabel(textAlignment: .center)
    let actionButton  = SPButton1(backgroundColor: .tertiaryLabel, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20

    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(contanierView, titleLabel, actionButton, messageLabel)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()

    }
    
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            contanierView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contanierView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contanierView.widthAnchor.constraint(equalToConstant: 280),
            contanierView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
    }
    
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contanierView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: contanierView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureMessageLabel() {
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: contanierView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: contanierView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
            
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
