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
    
    private var redComponentOfColorView: CGFloat = 0
    private var greenComponentOfColorView: CGFloat = 0
    private var blueComponentOfColorView: CGFloat = 0
    private var alphaComponentOfColorView: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorizeButton.layer.cornerRadius = 10
        colorView.backgroundColor = UIColor.random
        
        matchSlidersWithColorView()
    }
    
    // MARK: - IBActions
    @IBAction func colorizeButtonTapped() {
        colorView.backgroundColor = UIColor.random
        matchSlidersWithColorView()
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
    private func matchSlidersWithColorView() {
        colorView.backgroundColor!.getRed(&redComponentOfColorView,
                                          green: &greenComponentOfColorView,
                                          blue: &blueComponentOfColorView,
                                          alpha: &alphaComponentOfColorView)
        
        redSlider.value = Float(redComponentOfColorView)
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        
        greenSlider.value = Float(greenComponentOfColorView)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        
        blueSlider.value = Float(blueComponentOfColorView)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func changeColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: alphaComponentOfColorView)
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
