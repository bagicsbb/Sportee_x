//
//  SPTeamDetailsStackView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPTeamDetailsStackView: UIStackView {
    
    let attribute = SPBodyLabel(textAlignment: .center)
    let detail = SPTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(attributeText: String, detailText: String) {
        super.init(frame: .zero)
            configure(attributeText: attributeText , detailText: detailText)
    }
    
    func configure(attributeText: String, detailText: String) {
        
        backgroundColor                         = .systemBackground
        layer.cornerRadius                      = 10
        axis                                    = .horizontal
        distribution                            = .fillEqually
      translatesAutoresizingMaskIntoConstraints = false
        
        attribute.text          = attributeText
        attribute.font          = UIFont.systemFont(ofSize: 12, weight: .regular)
        attribute.textColor = .label
        detail.text             = detailText
        detail.numberOfLines    = 3
        
        
        addArrangedSubview(attribute)
        addArrangedSubview(detail)
    }
    
}
