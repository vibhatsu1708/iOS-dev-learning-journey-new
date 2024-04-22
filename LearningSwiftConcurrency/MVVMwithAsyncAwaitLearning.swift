//
//  MVVMwithAsyncAwaitLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 23/04/24.
//

import SwiftUI

final class MyManagerClass {
    func getData() async throws -> String {
        return "This is some data!"
    }
}

actor MyManagerActor {
    func getData() async throws -> String {
        return "This is some data!"
    }
}

@MainActor
final class MVVMViewModel: ObservableObject {
    let managerClass = MyManagerClass()
    let managerActor = MyManagerActor()
    
//    @MainActor 
    @Published private(set) var myData: String = "Starting text"
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    // since the variable, myData is of MainActor, the work being done on the variable on the main actor should also work on the main actor, so you can either add on the function or on the task, like below, by using "@MainActor in"
    // The other alternative way is to put the entire class on the main actor, like above.
//    @MainActor
    func callToActionButtonPressed() {
        let task = Task { /*@MainActor in*/
            do {
                myData = try await managerClass.getData()
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}

struct MVVMwithAsyncAwaitLearning: View {
    @StateObject var viewModel = MVVMViewModel()
    
    var body: some View {
        VStack {
            Button("Click me") {
                viewModel.callToActionButtonPressed()
            }
            
            
        }
        .onDisappear {
            viewModel.cancelTasks()
        }
    }
}

#Preview {
    MVVMwithAsyncAwaitLearning()
}
