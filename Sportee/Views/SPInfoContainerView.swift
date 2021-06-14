//
//  SPAlertContainerView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class SPInfoContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       backgroundColor                              = .systemBackground
       layer.cornerRadius                           = 20
       layer.borderWidth                            = 3
       layer.borderColor                            = UIColor.white.cgColor
       translatesAutoresizingMaskIntoConstraints    = false
    }
    
}
