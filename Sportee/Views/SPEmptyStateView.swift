//
//  SPEmptyStateView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 11..
//

import UIKit

class SPEmptyStateView: UIView {
    
    let messageLabel = SPTitleLabel(textAlignment: .center, fontSize: 36)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        addSubviews(messageLabel, logoImageView)
        configureMessageLabel()
        configureLogoImageView()
    }
    
    private func configureMessageLabel() {
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureLogoImageView() {
        logoImageView.image = UIImage(named: "sportee_light")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        
    }
}
