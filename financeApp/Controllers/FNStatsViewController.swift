//
//  FNStatsViewController.swift
//  financeApp
//
//  Created by Anton on 10/6/20.
//

import UIKit

class FNStatsViewController: UIViewController {
    
    private let label = FNLabel(text: "")
    
    override func viewDidLoad() {
        self.view.addSubview(label)
        label.anchorCenterXToSubview(subView: view)
        label.anchorCenterYToSubview(subView: view)
    }
}
