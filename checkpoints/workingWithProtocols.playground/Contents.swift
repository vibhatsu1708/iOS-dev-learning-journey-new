import Foundation

protocol Dish {
    var name: String { get }
    var preparationMinutes: Int { get set }
    func prepare()
    func plate(artisticLevel: Int)
}

class MainDish: Dish {
    var name: String
    var preparationMinutes: Int
    init(name: String, preparationMinutes: Int) {
        self.name = name
        self.preparationMinutes = preparationMinutes
    }
    
    func prepare() {
        print("Preparing \(name) for \(preparationMinutes) minutes")
    }
    func plate(artisticLevel: Int) {
        print("Plating artistic level: \(artisticLevel)")
    }
}

var mainDish = MainDish(name: "Super Spaghetti", preparationMinutes: 35)
mainDish.prepare()
mainDish.plate(artisticLevel: 10)
