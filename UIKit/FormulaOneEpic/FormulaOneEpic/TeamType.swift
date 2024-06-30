//
//  Teams.swift
//  FormulaOneEpic
//
//  Created by Vedant Mistry on 27/06/24.
//

import Foundation
import UIKit

enum TeamType {
    case RedBull
    case Ferrari
    case Mercedes
    case Mclaren
    case AstonMartin
    case RacingBulls
    case StakeSauber
    case Haas
    case Williams
    case Alpine
}

extension TeamType {
    // for the team logo data
    var teamLogo: UIImage {
        switch self {
        case .RedBull:
            return UIImage(named: "RedBull")!
        case .Ferrari:
            return UIImage(named: "Ferrari")!
        case .Mercedes:
            return UIImage(named: "Mercedes")!
        case .Mclaren:
            return UIImage(named: "Mclaren")!
        case .AstonMartin:
            return UIImage(named: "AstonMartin")!
        case .RacingBulls:
            return UIImage(named: "RacingBulls")!
        case .StakeSauber:
            return UIImage(named: "StakeSauber")!
        case .Haas:
            return UIImage(named: "Haas")!
        case .Williams:
            return UIImage(named: "Williams")!
        case .Alpine:
            return UIImage(named: "Alpine")!
        }
    }
    
    // for the background color
    var teamBackgroundColor: UIColor {
        switch self {
        case .RedBull:
            return UIColor(.purple)
        case .Ferrari:
            return UIColor(.red)
        case .Mercedes:
            return UIColor(.black)
        case .Mclaren:
            return UIColor(.orange)
        case .AstonMartin:
            return UIColor(.mint)
        case .RacingBulls:
            return UIColor(.blue)
        case .StakeSauber:
            return UIColor(.green)
        case .Haas:
            return UIColor(.gray)
        case .Williams:
            return UIColor(.purple)
        case .Alpine:
            return UIColor(.pink)
        }
    }
}
