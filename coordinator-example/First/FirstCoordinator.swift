//
//  FirstCoordinator.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 4.07.2023.
//

import UIKit

class FirstCoordinator: Coordinator {    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FirstViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushSecond() {
        let child = SecondCoordinator(navigationController: navigationController)
        child.parentCoodinator = self
        childCoordinators.append(child)
        child.start()
    }
}
