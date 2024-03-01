import Foundation

struct Quiz {
    let title: String
    let dateCreated: Date
    
    // structs have an implicit init, automaticallly generated by the system when created.
    
    // custom inits can be created if you want to pass a default value to one of the parameters.
    init(title: String, dateCreated: Date = .now) {
        self.title = title
        self.dateCreated = dateCreated
    }
}

let myObject: String = "hello world!"
let myQuiz: Quiz = Quiz(title: "Quiz 1", dateCreated: .now)

// since dateCreated already has a value, no need to give a value in this initialiser.
let myQuiz1: Quiz = Quiz(title: "Quiz 1")

//MARK: - how to mutate a struct


// model for the user
// struct that has only lets, called an immutable structs, can not mutate it, can not be changed.
struct UserModel {
    let name: String
    let isPremium: Bool
}

var user1 = UserModel(name: "albert", isPremium: false)

func markUserAsPremium() {
    print(user1)
    
    // this is how to change the value of user1's isPremium since it belongs to an immutable struct
    // basically creating a brand new user model, and then giving the value
    user1 = UserModel(name: user1.name, isPremium: true)
    print(user1)
}

//MARK: - new example

// this is a mutable struct
struct UserModel2 {
    let name: String
    var isPremium: Bool
}

var user2 = UserModel2(name: "albert", isPremium: false)

func markUser2AsPremium() {
    print(user2)
    user2.isPremium = true
    print(user2)
}

//MARK: - new example

// THIS IS A BETTER CODING PRACTICE, BECAUSE THE FUNCTION IS INSIDE THE STRUCT.
// immutable struct
struct UserModel3 {
    let name: String
    let isPremium: Bool
    
    // now the immutable struct's value can be modified by placing the function inside the struct which returns a completely different object with the value to be changed as the parameter.
    func markUserAsPremium3(changeUserPremium: Bool) -> UserModel3 {
        return UserModel3(name: "albert", isPremium: changeUserPremium)
    }
}

var user3: UserModel3 = UserModel3(name: "albert", isPremium: false)
user3 = user3.markUserAsPremium3(changeUserPremium: true)


// BETTER METHOD
// same can be done for mutable structs
struct UserModel4 {
    let name: String
    var isPremium: Bool
    
    // using the keyword mutating before the function declaration tells the compiler that the value needs to be changed inside the struct when called
    mutating func makeUserPremium(changeUserPremium: Bool) {
        isPremium = changeUserPremium
    }
}

var user4: UserModel4 = UserModel4(name: "albert", isPremium: false)
user4.makeUserPremium(changeUserPremium: true)
// cannot be done in the older way, the value can be 'get' but cannot be 'set' using this new method.
