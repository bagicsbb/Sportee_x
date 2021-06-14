//
//  StartScreenNC.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class StartScreenNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [SPSportPickerVC()]
    }


}
