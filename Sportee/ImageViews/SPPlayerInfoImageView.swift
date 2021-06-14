//
//  SPPlayerInfoImageView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 17..
//

import UIKit

class SPPlayerInfoImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        super.layoutSubviews()
        
        backgroundColor = .white
        layer.cornerRadius = 100
        layer.borderWidth = 3
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowOpacity = 10
        
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
    }
}
