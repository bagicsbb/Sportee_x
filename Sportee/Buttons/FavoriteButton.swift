//
//  FavoriteButton.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 11..
//

import UIKit

class FavoriteButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .white
   
    }
    
 

}
