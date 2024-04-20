//
//  GlobalActorsLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 21/04/24.
//

import SwiftUI

// To be able to use a global actor, you would need to create a class with the @globalactor keyword and a final class, so that no other class can inherit from this shared class instance.
// the shared instance should be an instance of your normal actor, shared.
@globalActor final class MyGlobalActor {
    static var shared = MyNewDataManager()
}



// lets say that this data manager is being used across multiple files, there is no need to worry for thread safety of it, because it is an actor.
actor MyNewDataManager {
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three", "Four", "Five", "Six"]
    }
}

class GlobalActorsViewModel: ObservableObject {
//    let manager = MyNewDataManager()
    // when you are using a global actor, it should be done through the single global actor instance. v
    let manager = MyGlobalActor.shared
    
    @Published var dataArray: [String] = []
    
    // when you call a function from an actor, it will by default be an async function or an async property, in actors you have to await the content to load.
    // when using the global actor, lets say this function is not async.
    func getData() {
        Task {
            let data = await manager.getDataFromDatabase()
            self.dataArray = data
        }
    }
    
    // lets say you have a function in this manager class that you want to isolate to your actor.
    // This is how you would do it, by preceding that function name with the name of the global actor, in this case, "@MyGlobalActor", and then the function name.
    // without it the function would not be isolated to the actor.
    @MyGlobalActor
    func getNewNewData() {
        Task {
            let data = await manager.getDataFromDatabase()
            self.dataArray = data
        }
    }
    
    // what if you wanted to take a function or anything that is not in the actor but isolate it to the actor.
    // that is the purpose of a Global Actor.
}

struct GlobalActorsLearning: View {
    @StateObject var viewModel = GlobalActorsViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getNewNewData()
            }
        }
    }
}

#Preview {
    GlobalActorsLearning()
}
