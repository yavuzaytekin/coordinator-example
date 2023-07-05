//
//  Coordinator.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 3.07.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func finish()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func finish() { }
    func childDidFinish(_ child: Coordinator?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
}
