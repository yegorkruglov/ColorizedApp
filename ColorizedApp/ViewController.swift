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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorizeButton.layer.cornerRadius = 10
        
        colorizeButtonTapped()
    }
    
    // MARK: - IBActions
    @IBAction func colorizeButtonTapped() {
        randomizeSliders()
        changeColorView()
        updateLabels()
    }
    
    @IBAction func redSliderAction() {
        changeColorView()
        updateLabels()
    }
    
    @IBAction func greenSliderAction() {
        changeColorView()
        updateLabels()
    }
    
    @IBAction func blueSliderAction() {
        changeColorView()
        updateLabels()
    }
    
    // MARK: - Private methods
    private func randomizeSliders() {
        redSlider.value = .random(in: 0...1)
        greenSlider.value = .random(in: 0...1)
        blueSlider.value = .random(in: 0...1)
    }
    
    private func changeColorView() {
        colorView.backgroundColor = getColorFromSliders()
    }
    
    private func getColorFromSliders() -> UIColor{
        UIColor(red: CGFloat(redSlider.value),
                       green: CGFloat(greenSlider.value),
                       blue: CGFloat(blueSlider.value),
                       alpha: 1)
    }
    
    private func updateLabels() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    }
}
