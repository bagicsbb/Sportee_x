//
//  SPPlayerInfoNameLabel.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 17..
//

import UIKit

class SPPlayerInfoNameLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = .center
        self.font = UIFont(name: "Copperplate-Bold", size: fontSize)
        configure()
    }
    
   private func configure() {
    
    if traitCollection.userInterfaceStyle == .dark {
        textColor = .white
    } else {
        textColor = .black
    }
    
    
    adjustsFontSizeToFitWidth = true
    adjustsFontForContentSizeCategory = true
    numberOfLines = 2
    minimumScaleFactor = 0.8
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
    clipsToBounds = true
    }
}
