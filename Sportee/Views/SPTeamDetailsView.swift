//
//  SPTeamDetailsView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPTeamDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(establishedDetail: String,stadiumDetail: String, locationDetail: String) {
        super.init(frame: .zero)
        configure(establishedDetail: establishedDetail, stadiumDetail: stadiumDetail,locationDetail: locationDetail)
    }
    
    
    func configure( establishedDetail: String, stadiumDetail: String, locationDetail: String) {
        
        layer.cornerRadius = 10
        
//        if traitCollection.userInterfaceStyle == .dark {
//            backgroundColor = .black
//            layer.borderWidth = 0.4
//            layer.borderColor = UIColor.darkGray.cgColor
//            
//            layer.shadowColor = UIColor.white.cgColor
//           
//            layer.shadowOffset = CGSize(width: 0, height: 2)
//           layer.shadowOpacity = 2
//
//           layer.shouldRasterize = true
//           layer.rasterizationScale = UIScreen.main.scale
//           
//        } else {
//            backgroundColor = .white
//            layer.borderWidth = 0.4
//            layer.borderColor = UIColor.lightGray.cgColor
//            
//           layer.shadowColor = UIColor.black.cgColor
//            layer.shadowOffset = CGSize(width: 0, height: 2)
//           layer.shadowOpacity = 2
//
//           layer.shouldRasterize = true
//           layer.rasterizationScale = UIScreen.main.scale
//        }

        
        let stack1 = SPTeamDetailsStackView(attributeText: "Est.:", detailText: establishedDetail)
        let stack2 = SPTeamDetailsStackView(attributeText: "Stadium:", detailText: stadiumDetail)
        let stack3 = SPTeamDetailsStackView(attributeText: "Location:", detailText: locationDetail)
        let padding: CGFloat = 5
        addSubviews(stack1, stack2, stack3)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack1.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            stack1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            stack1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            stack1.heightAnchor.constraint(equalToConstant: 45),
            
            stack2.topAnchor.constraint(equalTo: stack1.bottomAnchor, constant: padding),
            stack2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            stack2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            stack2.heightAnchor.constraint(equalTo: stack1.heightAnchor),
            
            stack3.topAnchor.constraint(equalTo: stack2.bottomAnchor, constant: padding),
            stack3.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            stack3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            stack3.heightAnchor.constraint(equalTo: stack1.heightAnchor),
            
        ])
        
        
    }
}
