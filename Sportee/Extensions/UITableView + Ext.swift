//
//  UITableView + Ext.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 13..
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCell() {
        tableFooterView = UIView(frame: .zero)
    }
}
