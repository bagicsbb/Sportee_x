//
//  SPTeamLogoContainerView.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 11..
//

import UIKit

class SPTeamLogoContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(childView: UIView) {
        super.init(frame: .zero)
        self.addSubview(childView)
        configure()
    }
    
    func configure() {
        backgroundColor = .systemGray2
        alpha           = 0.2
    }


}
