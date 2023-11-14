import Foundation

class Dish {
    private var ingredients: [String]
    private let name: String
    
    init(_ ingredients: [String], _ name: String) {
        self.ingredients = ingredients
        self.name = name
    }
    
    func printInfo() {
        print("Name: \(name)")
        print("Ingredients: \(ingredients)")
    }
}

final class AppetizerDish: Dish {
    override func printInfo() {
        print("Appetizer")
        super.printInfo()
    }
}

final class MainDish: Dish {
}

for _ in 1...5 {
    let randomNumber = Int.random(in: 0...1)
    let dish: Dish
    
    if randomNumber == 0 {
        dish = AppetizerDish(["Margherita", "Flatbread"], "Margherita Flatbread")
    } else {
        dish = AppetizerDish(["Spaghetti", "Tomato sauce"], "Super Spaghetti")
    }
    
    if let appetizerDish = dish as? AppetizerDish {
        appetizerDish.printInfo()
    }
    if dish is MainDish {
        print("Main Dish")
    }
}
