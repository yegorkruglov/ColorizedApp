//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Egor Kruglov on 28.04.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    @IBOutlet var getRandomColorButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var sliders: [UISlider]!
    
    var colorOfSuperView: UIColor!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        getRandomColorButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
        
        updateSlidersToColorOfSuperView()
        updateLabelsToSlidersValues()
    }
    
    // MARK: - IBActions
    @IBAction func getRandomColor() {
        randomizeSliders()
        updateLabelsToSlidersValues()
        updateColorView()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        guard let index = sliders.firstIndex(of: sender) else { return }
        labels[index].text = string(from: sender)
        
        updateColorView()
    }
    
    @IBAction func saveButtonTapped() {
    }
    
    
    // MARK: - Private methods
    private func randomizeSliders() {
        sliders.forEach { $0.value = .random(in: 0...1) }
    }
    
    private func updateLabelsToSlidersValues() {
        for (index, label) in labels.enumerated() {
            label.text = string(from: sliders[index])
        }
    }
    
    private func updateColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliders[0].value),
                                            green: CGFloat(sliders[1].value),
                                            blue: CGFloat(sliders[2].value),
                                            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func updateSlidersToColorOfSuperView() {
        var redComponent: CGFloat = 0
        var greenComponent: CGFloat = 0
        var blueComponent: CGFloat = 0

        colorOfSuperView.getRed(&redComponent, green: &greenComponent, blue: &blueComponent, alpha: nil)
        
        colorView.backgroundColor = UIColor(red: redComponent,
                                            green: greenComponent,
                                            blue: blueComponent,
                                            alpha: 1)
        
        for (slider, component) in zip(sliders, [redComponent, greenComponent, blueComponent]) {
            slider.value = Float(component)
        }
    }
}
