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
    
    
    @IBAction func colorSliderMove() {
        changeColor()
        // поставил сюда метод, чтобы первоначальный экран соответствовал первоначальной цветовой гаммме слайдеров, а не был белым по дефолту
    }
    
    
    @IBAction func changeNumber(_ sender: UISlider) {
        switch sender {
        case redSlider: move(slider: redSlider, chageNumber: redNumber)
        case greenSlider: move(slider: greenSlider, chageNumber: greenNumber)
        default: move(slider: blueSlider, chageNumber: blueNumber)
        }
        // в этом методе использовал sender т.к. не нашел как без него написать одну функцию для 3х слайдеров, чтобы не делать 3 отдельных экшна и не дублировать код в каждом
    }
    
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
}
    func move(slider: UISlider, chageNumber: UILabel) {
        slider.value = round(100 * slider.value) / 100
        chageNumber.text = String(slider.value)
}
    
}
