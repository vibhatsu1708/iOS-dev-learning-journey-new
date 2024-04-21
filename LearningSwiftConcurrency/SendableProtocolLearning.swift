//
//  SendableProtocolLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 21/04/24.
//

import SwiftUI

// The sendable protocol indicates that a value of the given type can be used safely in concurrent code.
actor CurrentUserManager {
    func updateDatabase(userInfo: MyUserInfo) {
        
    }
}

// to confirm that this struct is thread safe and to be passed into the actor, you need to conform it to the sendable protocol.
struct MyUserInfo: Sendable {
    let name: String
}

// what if sendable were used with classes.
// you would need to mark the class as final in order to make it work.
// if you are using the sendable protocol with a class, mkae sure that the properties are immutable, if the properties are mutable, you need to mark the class as "@unchecked", basically telling the compiler that you don't need to check, the user will be checking it. NEVER USE THIS, NOT RECOMMENDED.
// Now to make this class thread safe.
// Just by adding the unchecked, doesnt make it sendable, you also need to add your own queue to make it thread safe.
final class MyClassUserInfo: @unchecked Sendable {
    var name: String
    let queue = DispatchQueue(label: "com.MyApp.MyClassUserInfo")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        queue.sync {
            self.name = name
        }
    }
}

// view model referencing an actor
class SendableProtocolViewModel: ObservableObject {
    let manager = CurrentUserManager()
    
    func updateCurrentUserInfo() async {
        // value types such as strings, structs are sendable by default, which is not the case for the reference types such as functions, classes and actors.
        let info = MyUserInfo(name: "albert")
        
        await manager.updateDatabase(userInfo: info)
    }
}

struct SendableProtocolLearning: View {
    @StateObject var viewModel = SendableProtocolViewModel()
    
    var body: some View {
        Text("Hello, World!")
            .task {
                
            }
    }
}

#Preview {
    SendableProtocolLearning()
}
