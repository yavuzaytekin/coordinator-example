//
//  SecondViewController.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 4.07.2023.
//

import UIKit

final class SecondViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "SecondViewController"
        return label
    }()
    
    private let presentThirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Present Third!", for: .normal)
        button.addTarget(nil, action: #selector(toThird), for: .touchUpInside)
        return button
    }()
    
    weak var coordinator: SecondCoordinator?
    
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
        stackView.addArrangedSubview(presentThirdButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    @objc func toThird(_ sender: UIButton) {
        coordinator?.presentThird()
    }
}

