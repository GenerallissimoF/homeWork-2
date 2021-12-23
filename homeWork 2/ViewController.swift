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
    
    
    var startVC: StartViewController!
    var delegate: ViewControllerDelegate!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        redNumber.text = String(redSlider.value)
        greenNumber.text = String(greenSlider.value)
        blueNumber.text = String(blueSlider.value)
       
    }
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10

    }
    
    
    @IBAction func doneButtonPressd(_ sender: UIButton) {
        delegate.changeColorOfView(color: colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    
    @IBAction func colorSliderMove() {
        changeColor()
    }
    
    
    @IBAction func changeNumber(_ sender: UISlider) {
        switch sender {
        case redSlider: move(slider: redSlider, chageNumber: redNumber)
        case greenSlider: move(slider: greenSlider, chageNumber: greenNumber)
        default: move(slider: blueSlider, chageNumber: blueNumber)
        }
       
    }
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
}
    private func move(slider: UISlider, chageNumber: UILabel) {
        slider.value = round(100 * slider.value) / 100
        chageNumber.text = String(slider.value)
        
}
    
}
