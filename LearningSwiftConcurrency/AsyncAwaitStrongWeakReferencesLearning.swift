//
//  AsyncAwaitStrongWeakReferencesLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 22/04/24.
//

import SwiftUI

final class DataService {
    func getData() async -> String {
        return "Updated data!"
    }
}

final class StrongWeakReferencesViewModel: ObservableObject {
    var manager = DataService()
    @Published var data: String = "Some title!"
    
    // to be able to deal with cancelling tasks without using strong and weak references, you can do something like this.
    // basically creating a dummy task and setting it equal to that particular task or to all the tasks.
    private var someTask: Task<Void, Never>? = nil
    
    // what if you had an array of tasks, you could do this.
    private var someTasks: [Task<Void, Never>] = []
    
    // with a function to cancel the task
    func cancelTasks() {
        // can do either this
        someTask?.cancel()
        // or this
        someTask = nil
        
        
        
        // for cancelling multiple tasks in the array
        // basically first cancelling all the tasks and then setting the array to empty.
        someTasks.forEach({ $0.cancel() })
        someTasks = []
    }
    
    func updateData1() {
        Task {
            // This implies a strong reference.
            // you can add "self.data", but its mostly used when you are dealing with a parameter that is also data and you want to make it clear which data are you referring to. "self.data" refers to the particular data from the braces, of that function or class or whatever.
            data = await manager.getData()
        }
    }
    
    func updateData2() {
        Task {
            // This implies a strong reference.
            // with the "self.data"
            self.data = await manager.getData()
        }
    }
    
    func updateData3() {
        Task { [self] in
            // This also is a strong reference.
            self.data = await manager.getData()
        }
    }
    
    func updateData4() {
        Task { [weak self] in
            // This implies a weak reference.
            if let data = await self?.manager.getData() {
                self?.data = data
            }
        }
    }
    
    
    // we dont need to manage weak and strong references because we can manage the task itself.
    func updateData5() {
        someTask = Task {
            self.data = await manager.getData()
        }
    }
    
    func updateData6() {
        let task1 = Task {
            self.data = await manager.getData()
        }
        someTasks.append(task1)
        
        let task2 = Task {
            self.data = await manager.getData()
        }
        someTasks.append(task1)
        
        let task3 = Task {
            self.data = await manager.getData()
        }
        someTasks.append(task1)
    }
}

struct AsyncAwaitStrongWeakReferencesLearning: View {
    @StateObject var viewModel = StrongWeakReferencesViewModel()
    
    var body: some View {
        Text(viewModel.data)
            .onAppear {
                viewModel.updateData1()
            }
            .onDisappear {
                viewModel.cancelTasks()
            }
    }
}

#Preview {
    AsyncAwaitStrongWeakReferencesLearning()
}
