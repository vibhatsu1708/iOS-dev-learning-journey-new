//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Vedant Mistry on 27/06/24.
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemYellow
    }

    func setUpButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .black
        nextButton.configuration?.title = "Next"
        
        nextButton.addTarget(self, action: #selector(goToSecondScreen), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func goToSecondScreen() {
        let secondScreen = SecondScreen()
        secondScreen.title = "Second Screen"
        navigationController?.pushViewController(secondScreen, animated: true)
    }
}

