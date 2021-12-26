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
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        let viewcontrollerVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewcontrollerVC.delegate = self
        present(viewcontrollerVC, animated: true, completion: nil)

        viewcontrollerVC.colorView.backgroundColor = self.view.backgroundColor
        updateBackSliderValueFor(viewCont: viewcontrollerVC)
        updateNumbersLabelsFor(viewCont: viewcontrollerVC)
        updateNumbersTextFieldsFor(viewCont: viewcontrollerVC)
    }
    
    func colorToRGB(uiColor: UIColor) -> CIColor {
        CIColor(color: uiColor)
}
    func updateBackSliderValueFor(viewCont: ViewController) {
        let newColorFormat = colorToRGB(uiColor: self.view.backgroundColor!)
        viewCont.redSlider.value = Float(newColorFormat.red)
        viewCont.greenSlider.value = Float(newColorFormat.green)
        viewCont.blueSlider.value = Float(newColorFormat.blue)
    }
    
    
    func updateNumbersLabelsFor(viewCont: ViewController) {
        viewCont.redNumber.text = String(viewCont.redSlider.value)
        viewCont.greenNumber.text = String(viewCont.greenSlider.value)
        viewCont.blueNumber.text = String(viewCont.blueSlider.value)
    }
    func updateNumbersTextFieldsFor(viewCont: ViewController) {
        viewCont.redTextField.text = viewCont.redNumber.text
        viewCont.greenTextField.text = viewCont.greenNumber.text
        viewCont.blueTextField.text = viewCont.blueNumber.text
    }

}




    extension StartViewController: ViewControllerDelegate {
    func changeColorOfView(color: UIColor) {
        self.view.backgroundColor = color
        
    }
}
