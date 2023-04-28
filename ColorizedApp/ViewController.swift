//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Egor Kruglov on 28.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var colorizeButton: UIButton!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorizeButton.layer.cornerRadius = 10
        colorView.backgroundColor = UIColor.random
        
        updateSlidersToColorView()
    }
    
    // MARK: - IBActions
    @IBAction func colorizeButtonTapped() {
        colorView.backgroundColor = UIColor.random
        updateSlidersToColorView()
    }
    
    @IBAction func redSliderAction() {
        changeColorView()
        redValueLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        changeColorView()
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        changeColorView()
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - Private methods
    private func updateSlidersToColorView() {
        colorView.backgroundColor!.getRed(&red,
                                          green: &green,
                                          blue: &blue,
                                          alpha: &alpha)
        
        redSlider.value = Float(red)
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        
        greenSlider.value = Float(green)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        
        blueSlider.value = Float(blue)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: alpha)
    }
}

// MARK: - Extensions
extension UIColor {
    class var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
