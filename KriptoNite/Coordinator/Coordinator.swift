//
//  Coordinator.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 12/02/2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
