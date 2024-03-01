import Foundation

// Enums are the same as structs, but, all the cases in enums are known at runtime.

struct CarModel {
    let name: CarBrandOption
    let model: String
}

struct CarBrand {
    let name: String
}

// suppose all the car brands were stored in your db, and if you do not know the infinite number of car brands, you would use a struct.
// but if your db did have only these 3 car brands, you would use an enum.

// USE ENUMS IF AND ONLY IF YOU 100% KNOW ABOUT YOUR VALUES USED.
// enums are stored in memory like structs, but are immutable, cannot be changed unlike structs, which can be in certain ways.
enum CarBrandOption {
//    case porsche
//    case lamborghini
//    case nissan
    
    case porsche, lamborghini, nissan
    
    // using switch statements is better over if else in certain scenarios
    var title: String {
        switch self {
        case .porsche:
            "porsche"
        case .lamborghini:
            "lamborghini"
        case .nissan:
            "nissan"
        }
    }
}

//var car1: CarModel = CarModel(name: "porsche", model: "911 gt3 rs")
//var car2: CarModel = CarModel(name: "lamborghini", model: "revuelto")
//var car3: CarModel = CarModel(name: "nissan", model: "gt-r")

var carBrand1: CarBrand = CarBrand(name: "porsche")
var carBrand2: CarBrand = CarBrand(name: "lamborghini")
var carBrand3: CarBrand = CarBrand(name: "revuelto")

//var car1: CarModel = CarModel(name: carBrand1, model: "gt3 rs")
//var car2: CarModel = CarModel(name: carBrand2, model: "revuelto")
//var car3: CarModel = CarModel(name: carBrand3, model: "gt-r")

var car1: CarModel = CarModel(name: .porsche, model: "gt3 rs")
var car2: CarModel = CarModel(name: .lamborghini, model: "revuelto")
var car3: CarModel = CarModel(name: .nissan, model: "gt-r")

var nissanBrand: CarBrandOption = .nissan
print(nissanBrand)
