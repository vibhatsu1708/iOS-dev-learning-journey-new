import Foundation

enum Ingredient: String {
    case Tomato = "Tomato"
    case Lettuce = "Lettuce"
    case Capsicum = "Capsicum"
    case Broccoli = "Broccoli"
}
let ingredient = Ingredient.Broccoli

switch ingredient {
case .Tomato:
    print("Ingredient is \(ingredient.rawValue)")
case .Lettuce:
    print("Ingredient is \(ingredient.rawValue)")
case .Capsicum:
    print("Ingredient is \(ingredient.rawValue)")
case .Broccoli:
    print("Ingredient is \(ingredient.rawValue)")
}

//MARK: - new enum

enum RecipeInformation {
    case allergens(information: String)
}
let recipeInformation = RecipeInformation.allergens(information: "peanuts, milk, cheese")

switch recipeInformation {
case .allergens(let information):
    print("This meal includes \(information).")
}
