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
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        let viewcontrollerVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewcontrollerVC.delegate = self
        present(viewcontrollerVC, animated: true, completion: nil)
        viewcontrollerVC.colorView.backgroundColor = self.view.backgroundColor
    }
    
}

extension StartViewController: ViewControllerDelegate {
    func changeColorOfView(color: UIColor) {
        self.view.backgroundColor = color
        
    }
}
