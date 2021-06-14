//
//  SPSmallCardBackgroundView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 07..
//

import UIKit

class SPSmallCardBackgroundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        if traitCollection.userInterfaceStyle == .dark {
            backgroundColor = .secondarySystemBackground
            layer.borderWidth = 0.4
            layer.borderColor = UIColor.darkGray.cgColor
            
            layer.shadowColor = UIColor.systemGray.cgColor
           
            layer.shadowOffset = CGSize(width: 0, height: 2)
           layer.shadowOpacity = 2

           layer.shouldRasterize = true
           layer.rasterizationScale = UIScreen.main.scale
           
        } else {
            backgroundColor = .systemGroupedBackground
            layer.borderWidth = 0.4
            layer.borderColor = UIColor.lightGray.cgColor
            
           layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
           layer.shadowOpacity = 2

           layer.shouldRasterize = true
           layer.rasterizationScale = UIScreen.main.scale
        }
         
    }

}
