import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let categoryName: String
    let categoryMessage: String
    let categoryImage: String
    let subCategoryValues: [String: [String]]
}

class Categories_Model: ObservableObject {
    @Published var categories: [Category] = [
        Category(categoryName: "Dairy", 
                 categoryMessage: "Get 30% off on Amul Dairy Products", 
                 categoryImage: "dairy",
                 subCategoryValues: [
                    "Milk": ["₹181.60 per liter", "Fresh Cow's Milk"], 
                    "Yogurt": ["₹107.40 per container", "Amul Yogurt"], 
                    "Cheese": ["₹220 per block", "Go Cheese"],
                    "Butter": ["₹260 per stick", "Amul Salted Butter"],
                    "Ice Cream": ["₹370 per kg", "Vadilal's Frozen desert"],
                    "Whipped Cream": ["₹220 per can", "Amul Whipped Cream"],
                    "Cream Cheese": ["₹185 per block", "Amul Cream Cheese Garlic Butter Flavour"]]),
        Category(categoryName: "Munchies", 
                 categoryMessage: "Buy 1 get 1 on Good day small pack", 
                 categoryImage: "munchies",
                 subCategoryValues: [
                    "Samosa": ["₹15-20 per 200gm", "Haldiram's mini Samosas"],
                    "Pakora": ["₹10-15 per 200gm", "Haldiram's mini Pakoras"],
                    "Chikki": ["₹10-20 per 200gm", "Haldiram's Chikkis"],
                    "Khakhra": ["₹10-15 per 200gm", "Pav Bhaji Flavoured Khakhra"]]),
        Category(categoryName: "Cold Drinks", 
                 categoryMessage: "Everything at 39rs", 
                 categoryImage: "cold-drinks",
                 subCategoryValues: [
                    "Mango Lassi": ["₹30-40 per box", "Amul's Refreshing Mango Lassi"],
                    "Badam Milk": ["₹30-40 per box", "Amul Cool Badam Milk"],
                    "Jal Jeera": ["₹20-30 per glass", "Refreshing Jaljeera"],
                    "Rooh Afza": ["₹30-40 per bottle", "Iconic Rooh Afza with Free Shaker"],
                    "Coca Cola": ["₹40 per 750ml", "Sweetened Cold Drink"],
                    "Sprite": ["₹40 per 750ml", "Sweetened Clear Cold Drink"]]),
        Category(categoryName: "Tea", 
                 categoryMessage: "Buy 1 get 1 free on Tata tea 30gm pack", 
                 categoryImage: "tea",
                 subCategoryValues: [
                    "Tata Tea Premium": ["₹200-300 per packet", "Classic Indian Black Tea"],
                    "Red Label": ["₹150-250 per packet", "Popular Indian Black Tea"],
                    "Taj Mahal": ["₹100-200 per packet", "Indian Black Tea with Free Shaker"],
                    "Brooke Bond": ["₹150-250 per packet", "Indian Black Tea Mix with Free Glass"],
                    "Wagh Bakri": ["₹200-300 per packet", "Premium Indian Black Tea"]]),
        Category(categoryName: "Coffee",
                 categoryMessage: "Buy 1 get 1 free on Nescafe 30gm pack", 
                 categoryImage: "coffee",
                 subCategoryValues: [
                    "Nescafé Classic": ["₹100-200 per packet", "Indian Instant Coffee Brand"],
                    "Bru Instant Coffee": ["₹100-200 per packet", "Indian Instant Coffee Brand"],
                    "Tata Ground Coffee": ["₹200-300 per packet", "Instant Coffee Grounds"]]),
        Category(categoryName: "Fruits", 
                 categoryMessage: "Fresh fruits and Vegetables", 
                 categoryImage: "fruits",
                 subCategoryValues: [
                    "Mango": ["₹50-100 per kilogram", "Orange Kesar Mango"],
                    "Banana": ["₹30-50 per kilogram", "Yellow Ripe Bananas"],
                    "Apple": ["₹100-200 per kilogram", "Sweet, Crisp Texture Green Apples"],
                    "Orange": ["₹50-100 per kilogram", "Ripe Fresh Oranges"],
                    "Watermelon": ["₹30-50 per kilogram", "Perfectly Ripe Green Watermelons"]]),
        Category(categoryName: "Cleaning", 
                 categoryMessage: "Get 15rs off on Vim Gel", 
                 categoryImage: "cleaning",
                 subCategoryValues: [
                    "Harpic Toilet Cleaner": ["₹30-50 per bottle", "Powerful Blue Coloured Toilet Cleaner With Fresh Fragrance"],
                    "Dettol Antiseptic Liquid": ["₹100-200 per bottle", "Powerful Disinfectant For Multiple Usecases"],
                    "Lizol Floor Cleaner": ["₹100-200 per bottle", "Blue Coloured Disinfectant Used For Cleaning Floors"],
                    "Colin Glass Cleaner": ["₹100-150 per bottle", "Blue Coloured Glass Cleaner to Remove Stains from Surfaces"]]),
    ]
}
