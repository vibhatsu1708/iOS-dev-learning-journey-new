import Foundation

let recipesJSONString = """
[
    {
        "title": "Apple pie",
        "views": 3847,
        "rating": 4.5
    },
    {
        "title": "Boiled egg",
        "views": 10584,
        "rating": 4.9
    },
    {
        "title": "Bacon roll",
        "views": 5847,
        "rating": 3.2
    }
]
"""

struct Recipe: Decodable {
    var title: String
    var views: Int
    var rating: Double
}


let recipesData = Data(recipesJSONString.utf8)

let decoder = JSONDecoder()

let recipes = try! decoder.decode([Recipe].self, from: recipesData)

recipes.forEach {
    print("\($0.title): \($0.rating)")
}
