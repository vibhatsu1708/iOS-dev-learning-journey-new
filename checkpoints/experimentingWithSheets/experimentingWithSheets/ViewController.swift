//
//  ViewController.swift
//  experimentingWithSheets
//
//  Created by Vedant Mistry on 26/10/23.
//

import UIKit
import OverlayContainer

class ViewController: OverlayContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondViewController = SecondViewController()
        self.viewControllers = [secondViewController]
        self.delegate = self
    }
}
extension ViewController : OverlayContainerViewControllerDelegate {
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController, heightForNotchAt index: Int, availableSpace: CGFloat) -> CGFloat {
        switch Notches.allCases[index] {
        case .minimum:
            return availableSpace * 1/5
        case .medium:
            return availableSpace/2
        case .maximum:
            return availableSpace * 3/4
        }
    }
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return Notches.allCases.count
    }
}

enum Notches : Int, CaseIterable {
    case minimum, medium, maximum
}

