//
//  AppDelegate.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import UIKit
import SDWebImageSVGCoder

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let vm = CriptosDataViewModel()
//        let viewController = CriptosViewController(vm: vm)
//        let vm = WalletsDataViewModel()
//        let viewController = WalletViewController(vm: vm)
//        let navigation = UINavigationController(rootViewController: viewController)
        let navigation = UINavigationController()
        let coordinator = WalletsCoordinator(navigationController: navigation)
        coordinator.start()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }
}
