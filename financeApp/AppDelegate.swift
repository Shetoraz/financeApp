//
//  AppDelegate.swift
//  financeApp
//
//  Created by Anton on 9/22/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let startVC = FNTabBarController()
        window?.rootViewController = startVC
        window?.makeKeyAndVisible()
        return true
    }
}
