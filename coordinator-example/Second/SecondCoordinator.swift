//
//  SecondCoordinator.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 4.07.2023.
//

import UIKit

class SecondCoordinator: Coordinator {
    weak var parentCoodinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SecondViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        parentCoodinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
    
    func presentThird() {
        let child = ThirdCoordinator(navigationController: navigationController)
        child.parentCoodinator = self
        childCoordinators.append(child)
        child.start()
    }
}
