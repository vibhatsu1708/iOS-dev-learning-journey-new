//
//  ActorLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 21/04/24.
//

import SwiftUI

// This is without using Actors, only Classes.
// To make a class thread safe, is by making everything in the class run on the same thread or on the same queue.
// This is a thread safe class.
class MyDataManager {
    static let instance = MyDataManager()
    
    private init() {}
    
    var data: [String] = []
    // creating custom queue
    private let queue = DispatchQueue(label: "com.MyApp.MyDataManager")
    
    func getRandomData(completionHandler: @escaping (_ title: String?) -> Void) {
        // basically in this async block, every single line or output is being added to the queue/lock waiting to be executed.
        queue.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            
            completionHandler(self.data.randomElement())
        }
    }
}


// Using Actors
// Actors do what is done in classes to make it thread safe automatically, so no use of escaping completion handlers.
// same thing also happens in the actor, but the code is much quicker and much cleaner and also takes care of the data race problems.

// you cannot mix up isolated code with non isolated code, in this example, you cannot call a function call from the getNewTitle1() which is isloated from the getNewTitle2() which is marked as non isolated and vice versa.
actor MyActorDataManager {
    static let instance = MyActorDataManager()
    
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        
        return self.data.randomElement()
    }
    
    // in actors whenever you want to access any data inside an actor, you always have to await it. like if you were to access the data arrays outside of the actor you would have to "await actorReference.data", since this is isolated. But if you want to mark any element as not isolated you simply mark it as "nonisolated".
    
    // isolated code
    // this can be accessed by just, "await actorReference.getNewTitle1()"
    func getNewTitle1() -> String {
        return "New title"
    }
    
    // non isolated code
    // now this can be accessed by just, "actorReference.getNewTitle2()", without the await keyword.
    nonisolated
    func getNewTitle2() -> String {
        return "New title"
    }
}

struct HomeView: View {
    // using the manually done thread safe class
    let manager = MyDataManager.instance
    
    // using the by default thread safe actor
    let actorManager = MyActorDataManager.instance
    
    @State private var text: String = ""
    
    let timer = Timer.publish(every: 0.1, tolerance: nil ,on: .main, in: .common, options: nil).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer, perform: { _ in
            // when using the manually thread safe class
//            DispatchQueue.global(qos: .background).async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        self.text = data
//                    }
//                }
//            }
            
            // with the actor using Task
            Task {
                if let data = await actorManager.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
        })
    }
}

struct BrowseView: View {
    // using the manually done thread safe class
    let manager = MyDataManager.instance
    
    // using the by default thread safe actor
    let actorManager = MyActorDataManager.instance
    
    @State private var text: String = ""
    
    let timer = Timer.publish(every: 0.01, tolerance: nil ,on: .main, in: .common, options: nil).autoconnect()
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer, perform: { _ in
            // when using the manually thread safe class
//            DispatchQueue.global(qos: .background).async {
//                manager.getRandomData { title in
//                    if let data = title {
//                        self.text = data
//                    }
//                }
//            }
            
            // with the actor using Task
            Task {
                if let data = await actorManager.getRandomData() {
                    await MainActor.run {
                        self.text = data
                    }
                }
            }
        })
    }
}

struct ActorLearning: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "heart.fill")
                }
            
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "flame.fill")
                }
        }
        .tint(Color.black)
    }
}

#Preview {
    ActorLearning()
}
