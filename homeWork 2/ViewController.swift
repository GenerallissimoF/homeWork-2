//
//  ViewController.swift
//  homeWork 2
//
//  Created by Ivan Adoniev on 10.12.2021.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var colorView: UIView!
  
    @IBOutlet weak var redNumber: UILabel!
    @IBOutlet weak var greenNumber: UILabel!
    @IBOutlet weak var blueNumber: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
   
    var startVC: StartViewController!
    var delegate: ViewControllerDelegate!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        changeColor()
        redNumber.text = String(redSlider.value)
        greenNumber.text = String(greenSlider.value)
        blueNumber.text = String(blueSlider.value)
        configureTextFields()
        
        
        
    }
    override func viewWillLayoutSubviews() {
        colorView.layer.cornerRadius = 10
    
    }
    
    
    
    @IBAction func doneButtonPressd(_ sender: UIButton) {
        delegate.changeColorOfView(color: colorView.backgroundColor!)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func colorSliderMove() {
    changeColor()
   }
    
    
    @IBAction func changeNumber(_ sender: UISlider) {
        switch sender {
        case redSlider: move(slider: redSlider,
                             chageNumberLab: redNumber,
                             changeNumberTF: redTextField)
        case greenSlider: move(slider: greenSlider,
                               chageNumberLab: greenNumber,
                               changeNumberTF: greenTextField )
        default: move(slider: blueSlider,
                      chageNumberLab: blueNumber,
                      changeNumberTF: blueTextField)
        }
        
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {}
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
}
   
    ////////////////////////////////////////////////////////////////////////////////////////////////////////
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField: checkValuesOf(textField: redTextField,
                                         numberLabel: redNumber,
                                         slider: redSlider)
        case greenTextField: checkValuesOf(textField: greenTextField,
                                           numberLabel: greenNumber,
                                           slider: greenSlider)
        default:  checkValuesOf(textField: blueTextField,
                                numberLabel: blueNumber,
                                slider: blueSlider)
        
        }
        
        
    }
    
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 4
        }
    
    
    private func move(slider: UISlider, chageNumberLab: UILabel, changeNumberTF: UITextField) {
        slider.value = round(100 * slider.value) / 100
        chageNumberLab.text = String(slider.value)
        changeNumberTF.text = String(slider.value)
        
        
}
    private func configureTextFields () {
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        redTextField.text = redNumber.text
        greenTextField.text = greenNumber.text
        blueTextField.text = blueNumber.text
        
    }
    private func checkValuesOf(textField: UITextField, numberLabel: UILabel, slider: UISlider) {
        if let _ = Float(textField.text ?? "") {
            numberLabel.text = textField.text
            slider.value = Float(textField.text!)!
            changeColor()
    
        } else {
            textField.becomeFirstResponder()
            textField.text = ""
            let alert = UIAlertController(title: "Warning", message: "Please, try againe", preferredStyle: .alert)
            let alertButton = UIAlertAction.init(title: "ok", style: .default, handler: nil)
           alert.addAction(alertButton)
           present(alert, animated: true, completion: nil)
            
        }
    }
    
  
    
}

