//
//  ThirdCoordinator.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 4.07.2023.
//

import UIKit

class ThirdCoordinator: Coordinator {
    weak var parentCoodinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var viewController: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ThirdViewController()
        vc.coordinator = self
        viewController = vc
        navigationController.viewControllers.last?.present(vc, animated: true)
    }
    
    func finish() {
        parentCoodinator?.childDidFinish(self)
        viewController?.dismiss(animated: true)
    }
}
