//
//  SPNoMatchesCell.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 06. 04..
//

import UIKit

class SPNoMatchesCell: UITableViewCell {

    
    static let reuseID = "NoEventCell"
    
    let noMatchLabel = SPBodyLabel(textAlignment: .center)


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
            translatesAutoresizingMaskIntoConstraints = false
        addSubviews(noMatchLabel )
        noMatchLabel.translatesAutoresizingMaskIntoConstraints = false
        noMatchLabel.text = "No further matches in this season!"
        
        noMatchLabel.font = UIFont.systemFont(ofSize: 20)
    

        NSLayoutConstraint.activate([
            
            noMatchLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            noMatchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            noMatchLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            noMatchLabel.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }

}
