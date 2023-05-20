//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Egor Kruglov on 19.05.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewColorForView(_ color: UIColor)
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.receivedColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

    // MARK: - SettingsViewControllerDelegate
extension StartViewController: SettingsViewControllerDelegate {
    func setNewColorForView(_ color: UIColor) {
        view.backgroundColor = color
    }
}
