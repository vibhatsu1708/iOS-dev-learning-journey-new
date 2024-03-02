import Foundation

var cart: [String: Bool] = [
    "apples": true,
    "bananas": false,
    "oranges": true
]

if let grapesExist = cart["grapes"] {
    print("grapes")
} else {
    print("no grapes")
}

// use the above if let unwrapping to find if a value exists or not, because if it doesn't, it could result in an error, since no value is nil
//print(cart["grapes"])

cart.removeValue(forKey: "apples")
print(cart)
