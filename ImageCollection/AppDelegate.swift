//
//  AppDelegate.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let builder = Builder()
        let homeVc = builder.createHomeModule()
        window?.rootViewController = homeVc
        window?.makeKeyAndVisible()
        
        return true
    }
}

