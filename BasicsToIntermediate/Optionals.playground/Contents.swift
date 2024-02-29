import Foundation

// Refreshing concepts on Optionals

// always has a value
let myBool: Bool = false

// may or may not have a value, may be or may not be nil
var otherBool: Bool? = nil

let newValue: Bool? = otherBool

// the new value 2 is equal to ther otherBool's value, else it is equal to false if it is nil
let newValue2: Bool = otherBool ?? false

var myString: String? = "helloworld"

myString = nil
let myStringText: String = myString ?? "no string text"

var userIsPremium: Bool? = true
func checkIfUserPremium() -> Bool? {
    return userIsPremium
}

func checkIfUserPremium1() -> Bool {
    if let newValue = userIsPremium {
        return newValue
    }
    return false
}
print(checkIfUserPremium1())
