import UIKit

let defaults = UserDefaults.standard

defaults.setValue(6.9, forKey: "Volume")
defaults.setValue("true", forKey: "musicPlaying")
defaults.setValue("TonyStark", forKey: "IronMan")

let groceries = ["fruits", "dairy products", "notebooks"]
defaults.set(groceries, forKey: "groceriesList")

let dict = ["apples": 2, "bananas": 3]
defaults.set(dict, forKey: "myDictionary")

let volume = defaults.float(forKey: "Volume")
let musicStatus = defaults.bool(forKey: "musicPlaying")
let ironman = defaults.string(forKey: "IronMan")

defaults.array(forKey: "groceriesList") as! [String]
defaults.dictionary(forKey: "myDictionary") as! [String: Int]
