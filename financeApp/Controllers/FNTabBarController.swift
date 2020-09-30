//
//  ViewController.swift
//  financeApp
//
//  Created by Anton on 9/22/20.
//

import UIKit

class FNTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainController             = MainViewController()
        let navController              = UINavigationController(rootViewController: mainController)
        navController.tabBarItem.title = "Main"
        viewControllers = [navController]
    }
    
    private func createNavControllerWithNavBar(controller: UIViewController, title: String) -> UINavigationController {
        let mainController             = UIViewController()
        let navController              = UINavigationController(rootViewController: mainController)
        navController.tabBarItem.title = title
        
        return navController
    }
}

