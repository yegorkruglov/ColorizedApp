//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Egor Kruglov on 19.05.2023.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorOfSuperView = view.backgroundColor
    }
}
