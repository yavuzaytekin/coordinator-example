//
//  ThirdViewController.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 4.07.2023.
//

import UIKit

final class ThirdViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "ThirdViewController"
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Go Back!", for: .normal)
        button.addTarget(nil, action: #selector(toBack), for: .touchUpInside)
        return button
    }()
    
    weak var coordinator: ThirdCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.finish()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(backButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    @objc func toBack(_ sender: UIButton) {
        coordinator?.finish()
    }
}
