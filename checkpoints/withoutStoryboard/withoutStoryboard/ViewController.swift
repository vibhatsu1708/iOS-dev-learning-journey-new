//
//  ViewController.swift
//  withoutStoryboard
//
//  Created by Vedant Mistry on 24/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
        label.textAlignment = .center
        label.text = "hello world!"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(label)
    }


}

