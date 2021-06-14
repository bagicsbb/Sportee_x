//
//  SPPlayerDetailsView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 18..
//

import UIKit

class SPPlayerDetailsView: UIView {
    
    var attributeText = SPBodyLabel(textAlignment: .center)
    var detailsText = SPTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
   convenience init(attributeText: String, detailsText: String) {
        self.init(frame: .zero)
        self.attributeText.text = attributeText
        self.detailsText.text   = detailsText
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(attributeText, detailsText)
        self.bringSubviewToFront(attributeText)
        self.bringSubviewToFront(detailsText)
        detailsText.numberOfLines = 0
        
        attributeText.textColor = .lightText
        
        NSLayoutConstraint.activate([
            
            attributeText.heightAnchor.constraint(equalToConstant: 20),
            attributeText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            attributeText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            attributeText.bottomAnchor.constraint(equalTo: detailsText.topAnchor, constant: -6),
            
            detailsText.topAnchor.constraint(equalTo: attributeText.bottomAnchor, constant: 6),
            detailsText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            detailsText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            detailsText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3)
            
        
        ])
        
        
        
    }
    
}
