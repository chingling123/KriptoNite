//
//  WalletsCoordinator.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

class WalletsCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = WalletViewController(vm: WalletsDataViewModel(), coordinator: self)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func start(type: WalletsType) {
        let viewController = UIViewController()
        viewController.title = type.rawValue
        viewController.view.backgroundColor = .systemBackground
        self.navigationController.present(viewController, animated: true)
    }
}
