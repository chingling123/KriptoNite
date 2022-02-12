//
//  HomeViewController.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let vmCriptos = CriptosDataViewModel()
        let criptosViewController = CriptosViewController(vm: vmCriptos)
        let criptosTabBarItem = UITabBarItem(title: "Cryptos", image: UIImage(systemName: "list.bullet.rectangle"), tag: 0)
        criptosViewController.tabBarItem = criptosTabBarItem
        
        let vmWallets = WalletsDataViewModel()
        let walletsViewController = WalletViewController(vm: vmWallets, coordinator: WalletsCoordinator(navigationController: self.navigationController ?? UINavigationController()))
        let walletsTabBarItem = UITabBarItem(title: "Wallets", image: UIImage(systemName: "menucard"), selectedImage: UIImage(systemName: "menucard.fill"))
        walletsViewController.tabBarItem = walletsTabBarItem
        
        viewControllers = [criptosViewController, walletsViewController]
        tabBar.backgroundColor = .systemBackground
    }
}
