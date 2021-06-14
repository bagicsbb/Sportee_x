//
//  SPResultLabel.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 20..
//

import UIKit

class SPResultLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
   private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
    adjustsFontForContentSizeCategory = true
    numberOfLines = 0
    minimumScaleFactor = 0.8
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
    }

}
