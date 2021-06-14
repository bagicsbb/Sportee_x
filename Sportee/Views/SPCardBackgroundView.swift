//
//  CardBackgroundView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 07..
//

import UIKit

class SPCardBackgroundView: UIView {
    
    var screwImage1 = UIImageView()
    var screwImage2 = UIImageView()
    var screwImage3 = UIImageView()
    var screwImage4 = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layoutSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        screwImage1.image = UIImage(named: "screw")
        screwImage2.image = UIImage(named: "screw")
        screwImage3.image = UIImage(named: "screw")
        screwImage4.image = UIImage(named: "screw")
        
        screwImage1.translatesAutoresizingMaskIntoConstraints = false
        screwImage2.translatesAutoresizingMaskIntoConstraints = false
        screwImage3.translatesAutoresizingMaskIntoConstraints = false
        screwImage4.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(screwImage1, screwImage2, screwImage3, screwImage4)
        
        if traitCollection.userInterfaceStyle == .dark {
            backgroundColor = .systemBackground
            layer.borderWidth = 2
            layer.borderColor = UIColor.systemGray.cgColor
        } else {
            backgroundColor = .systemBackground
            layer.borderWidth = 3
            layer.borderColor = UIColor.lightGray.cgColor
        }
        
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
        
            screwImage1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            screwImage1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            screwImage1.heightAnchor.constraint(equalToConstant: 15),
            screwImage1.widthAnchor.constraint(equalToConstant: 15),
            
            screwImage2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            screwImage2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            screwImage2.heightAnchor.constraint(equalToConstant: 15),
            screwImage2.widthAnchor.constraint(equalToConstant: 15),
            
            screwImage3.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            screwImage3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            screwImage3.heightAnchor.constraint(equalToConstant: 15),
            screwImage3.widthAnchor.constraint(equalToConstant: 15),
            
            screwImage4.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            screwImage4.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            screwImage4.heightAnchor.constraint(equalToConstant: 15),
            screwImage4.widthAnchor.constraint(equalToConstant: 15),

            
        ])
    }

}
