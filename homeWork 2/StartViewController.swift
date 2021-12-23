//
//  StartViewController.swift
//  homeWork 2
//
//  Created by Ivan Adoniev on 23.12.2021.
//

import UIKit

protocol ViewControllerDelegate {
    
    func changeColorOfView(color: UIColor)
}

class StartViewController: UIViewController {
   
    var viewCon: StartViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
   
}

extension StartViewController: ViewControllerDelegate {
    func changeColorOfView(color: UIColor) {
        self.view.backgroundColor = color
    }
}
