struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}
var temp1 = Fahrenheit()
print(temp1.temperature)

//MARK: - custom intialization
struct Celsius {
    var tempCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        tempCelsius = (fahrenheit - 23.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        tempCelsius = (kelvin - 273.15)
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(boilingPointOfWater.tempCelsius, freezingPointOfWater.tempCelsius)

//MARK: - parameter names and argument labels
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
var color1 = Color(red: 12.0, green: 12.0, blue: 11.0)
var color2 = Color(white: 255)
print(color1.red, color1.blue, color1.green)
print(color2.red, color2.blue, color2.green)

//MARK: - initializer parameters with argument labels
struct Temperature {
    var tempCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        tempCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        tempCelsius = (kelvin - 273.15)
    }
    init(_ celsius: Double) {
        tempCelsius = celsius
    }
}

//MARK: - Optional property types
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String, response: String? = nil) {
        self.text = text
        self.response = response
    }
    func ask() {
        print(text)
    }
}
let question1 = SurveyQuestion(text: "What is your name?")
question1.ask()

//MARK: - Default initializers
class ShoppingListItem {
    var name: String
    var quantity: Int
    var purchased: Bool = false
    var category: String?
    
    init(name: String, quantity: Int, purchased: Bool, category: String?) {
        self.name = name
        self.quantity = quantity
        self.purchased = purchased
        self.category = category
    }
}
var bananas = ShoppingListItem(name: "bananas", quantity: 2, purchased: true, category: "fruits")
print(bananas.name)

//MARK: - memberwise intializers for structure types
struct Size {
    var width = 0.0, height = 0.0
    var area: Double {
        return (width * height)
    }
}
let twoByTwo = Size(width: 2.0, height: 2.0)
print(twoByTwo.area)

