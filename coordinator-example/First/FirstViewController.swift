//
//  FirstViewController.swift
//  coordinator-example
//
//  Created by Yavuz Aytekin on 3.07.2023.
//

import UIKit

final class FirstViewController: UIViewController {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "FirstViewController"
        return label
    }()
    
    private let pushSecondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Push Second!", for: .normal)
        button.addTarget(nil, action: #selector(toSecond), for: .touchUpInside)
        return button
    }()
    
    weak var coordinator: FirstCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(pushSecondButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    @objc func toSecond(_ sender: UIButton) {
        coordinator?.pushSecond()
    }
}
