//
//  XButton.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 22..
//

import UIKit

class XButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
 

}
