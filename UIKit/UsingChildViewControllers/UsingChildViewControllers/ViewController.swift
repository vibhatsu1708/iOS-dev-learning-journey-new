//
//  ViewController.swift
//  UsingChildViewControllers
//
//  Created by Vedant Mistry on 30/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    let secondChildVC = SecondChildViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSecondChildVC()
    }
    
    func addSecondChildVC() {
        addChild(SecondChildViewController())
        view.addSubview(secondChildVC.view)
        secondChildVC.view.backgroundColor = .blue
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints()
    }
    
    func setSecondChildVCConstraints() {
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}

