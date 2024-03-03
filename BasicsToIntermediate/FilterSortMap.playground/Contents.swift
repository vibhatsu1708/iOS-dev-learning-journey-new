import Foundation

struct DatabaseUser {
    let name: String
    let isPremium: Bool
    let order: Int
}

var allUsers: [DatabaseUser] = [
    DatabaseUser(name: "albert", isPremium: true, order: 4),
    DatabaseUser(name: "robert", isPremium: false, order: 1),
    DatabaseUser(name: "tony", isPremium: true, order: 100),
    DatabaseUser(name: "bruce", isPremium: false, order: 3)
]

//MARK: - Filtering

// older method using for loop
//var allPremiumUsers: [DatabaseUser] = []
//for user in allUsers {
//    if user.isPremium {
//        allPremiumUsers.append(user)
//    }
//}

// better method for filtering
// better method 1
//var allPremiumUsers: [DatabaseUser] = allUsers.filter { user in
//    if user.isPremium {
//        return true
//    }
//    return false
//}

// method 2
//var allPremiumUsers: [DatabaseUser] = allUsers.filter { user in user.isPremium }

// method 3
// BETTER METHOD
var allPremiumUsers: [DatabaseUser] = allUsers.filter({ $0.isPremium })


//MARK: - Sorting
// objective is to sort the users according to their order number
// method 1
//var orderedUsers: [DatabaseUser] = allUsers.sorted { user1, user2 in
//    return user1.order < user2.order
//}

// method 2
//var orderedUsers: [DatabaseUser] = allUsers.sorted { user1, user2 in
//    user1.order < user2.order
//}

// method 3
// BETTER METHOD
var orderedUsers: [DatabaseUser] = allUsers.sorted(by: { $0.order < $1.order })

//print(orderedUsers)

//MARK: - mapping
// method 1
//var userNames: [String] = allUsers.map { user in
//    return user.name
//}

// method 2
//var userNames: [String] = allUsers.map { user in
//    user.name
//}

// method 3
// BETTER METHOD
var userNames: [String] = allUsers.map({ $0.name })

print(userNames)
