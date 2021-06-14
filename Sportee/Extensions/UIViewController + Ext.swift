//
//  UIViewController + Ext.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentSPAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC                     = SPAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentInfoVCOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC                     = SPDatePickerVC()
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        
        let safariVC                        = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor  = .systemGreen
        present(safariVC, animated: true)
    }
}
