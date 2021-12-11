//
//  ViewController.swift
//  homeWork 2
//
//  Created by Ivan Adoniev on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
  
    
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
    }
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10

    }
    
    
    @IBAction func redSliderMove() {
    redSlider.value = round(100 * redSlider.value) / 100
    redNumber.text = String(redSlider.value)
    changeColor()
    }
    
    @IBAction func greenSliderAction() {
    greenSlider.value = round(100 * greenSlider.value) / 100
    greenNumber.text = String(greenSlider.value)
    changeColor()
    }
    @IBAction func blueSliderAction() {
    blueSlider.value = round(100 * blueSlider.value) / 100
    blueNumber.text = String(blueSlider.value)
    changeColor()
    }
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
}

}
    
