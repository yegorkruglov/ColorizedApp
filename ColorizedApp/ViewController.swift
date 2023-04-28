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
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorizeButton.layer.cornerRadius = 10
        colorView.backgroundColor = UIColor.random
        
        setupSliders()
    }
    
    @IBAction func colorizeButtonTapped() {
        colorView.backgroundColor = UIColor.random
        setupSliders()
    }
    
    @IBAction func redSliderAction() {
        redValueLabel.text = String(round(redSlider.value * 100) / 100)
        
    }
    
    @IBAction func greenSliderAction() {
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)
    }
    
    @IBAction func blueSliderAction() {
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
    }
    
    private func setupSliders() {
        colorView.backgroundColor!.getRed(&red,
                                         green: &green,
                                         blue: &blue,
                                         alpha: nil)
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = Float(red)
        redValueLabel.text = String(round(redSlider.value * 100) / 100)

        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = Float(green)
        greenValueLabel.text = String(round(greenSlider.value * 100) / 100)

        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = Float(blue)
        blueValueLabel.text = String(round(blueSlider.value * 100) / 100)
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

