//
//  FirstScreen.swift
//  FormulaOneEpic
//
//  Created by Vedant Mistry on 27/06/24.
//

import UIKit

class FirstScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemIndigo
    }
}
