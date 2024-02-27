import Foundation


// Writing functions, or chaining multiple functions
//func myFirstFunction() {
//    print("first")
//    mySecondFunction()
//}
//
//func mySecondFunction() {
//    print("second")
//}
//myFirstFunction()

//func getUserName() -> String {
//    let userName = "albert"
//    return userName
//}
//let user_name: String = getUserName()

//MARK: - new example

//func showFirstScreen() {
//    var userDidCompleteOnboarding: Bool = true
//    var userProfileCreated: Bool = true
//    
//    let status = checkUserStatus(didCompleteOnboarding: userDidCompleteOnboarding, profileIsCreated: userProfileCreated)
//    
//    if status {
//        print("show home screen")
//    } else {
//        print("show onboarding screen")
//    }
//}
//
//func checkUserStatus(didCompleteOnboarding: Bool, profileIsCreated: Bool) -> Bool {
//    if didCompleteOnboarding && profileIsCreated {
//        return true
//    } else {
//        return false
//    }
//}
//
//showFirstScreen()

//MARK: - new example
//
//doSomething()
//
//func doSomething() -> String {
//    var isNew: String = "Avengers"
//    
////    if isNew == "Avengers" {
////        return "marvel"
////    } else {
////        return "not marvel"
////    }
//    
//    guard isNew == "Avengers" else {
//        return "not marvel"
//    }; return "marvel"
//}
//print(doSomething())

//MARK: - computed properties are basically functions
// good for when you don't need to pass in data

var number1: Int = 4
var number2: Int = 5
var numbersProd: Int {
    return number1 * number2
}
print(numbersProd)


