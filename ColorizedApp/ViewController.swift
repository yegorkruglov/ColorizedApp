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
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet var sliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        colorizeButton.layer.cornerRadius = 10
        
        randomizeSliders()
        updateLabels()
        updateColorView()
    }
    
    // MARK: - IBActions
    @IBAction func colorizeButtonTapped() {
        randomizeSliders()
        updateLabels()
        updateColorView()
    }
    
    
    @IBAction func sliderAction() {
        updateLabels()
        updateColorView()
    }
    
    // MARK: - Private methods
    private func randomizeSliders() {
        sliders.forEach { $0.value = .random(in: 0...1) }
    }
    
    private func updateLabels() {
        for (index, label) in labels.enumerated() {
            label.text = String(format: "%.2f", sliders[index].value)
        }
    }
    
    private func updateColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliders[0].value),
                                            green: CGFloat(sliders[1].value),
                                            blue: CGFloat(sliders[2].value),
                                            alpha: 1)
    }
}
