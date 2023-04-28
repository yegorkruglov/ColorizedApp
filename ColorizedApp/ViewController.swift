//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Egor Kruglov on 28.04.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    @IBOutlet var colorizeButton: UIButton!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorizeButton.layer.cornerRadius = 10

        colorView.backgroundColor = UIColor.random
    }
    
    @IBAction func colorizeButtonTapped() {
    }
    
    @IBAction func redSliderAction() {
    }
    
    @IBAction func greenSliderAction() {
    }
    
    @IBAction func blueSliderAction() {
    }
    
}

extension UIColor {
    
    class var random: UIColor {
        return UIColor(red: .random(in: 0.3...1),
                       green: .random(in: 0.3...1),
                       blue: .random(in: 0.3...1),
                       alpha: 1.0)
    }
}

