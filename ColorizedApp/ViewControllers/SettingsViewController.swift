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
    
    @IBOutlet var sliders: [UISlider]!
    @IBOutlet var textFields: [UITextField]!
    
    var receivedColor: UIColor!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        getRandomColorButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
        
        colorView.backgroundColor = receivedColor
        
        updateSlidersToColorView()
        updateTextfieldsToSlidersValues()
        setupTextFields()
    }
    
    // MARK: - IBActions
    @IBAction func getRandomColor() {
        randomizeSliders()
        updateTextfieldsToSlidersValues()
        updateColorView()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        guard let index = sliders.firstIndex(of: sender) else { return }
        textFields[index].text = string(from: sender)
        
        updateColorView()
    }
    
    @IBAction func saveButtonTapped() {
        view.endEditing(true)
        delegate.setNewColorForView(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func setupTextFields() {
        for textField in textFields {
            textField.delegate = self
            
            let keypadToolbar: UIToolbar = UIToolbar()
            
            keypadToolbar.items=[UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                                 target: self,
                                                 action: nil),
                                 UIBarButtonItem(title: "Done",
                                                 style: UIBarButtonItem.Style.done,
                                                 target: textField,
                                                 action: #selector(UITextField.resignFirstResponder))]
            
            keypadToolbar.sizeToFit()
            textField.inputAccessoryView = keypadToolbar
        }
    }
    
    private func randomizeSliders() {
        sliders.forEach { $0.value = .random(in: 0...1) }
    }
    
    private func updateTextfieldsToSlidersValues() {
        for (index, textfield) in textFields.enumerated() {
            textfield.text = string(from: sliders[index])
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
    
    private func updateSlidersToColorView() {
        var redComponent: CGFloat = 0
        var greenComponent: CGFloat = 0
        var blueComponent: CGFloat = 0
        
        receivedColor.getRed(&redComponent,
                           green: &greenComponent,
                           blue: &blueComponent,
                           alpha: nil)
                
        for (slider, component) in zip(sliders, [redComponent, greenComponent, blueComponent]) {
            slider.value = Float(component)
        }
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return }
        sliders[textField.tag].value = floatValue
        updateColorView()
    }
}
