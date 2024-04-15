//
//  TaskLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 03/04/24.
//

import SwiftUI

class TaskLearningViewModel: ObservableObject {
    @Published var image1: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage1() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/350") else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.image1 = image
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/350") else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            let image = UIImage(data: data)
            self.image2 = image
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct TaskLearningHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                NavigationLink("Click me") {
                    TaskLearning()
                }
            }
        }
    }
}

struct TaskLearning: View {
    @StateObject var viewModel = TaskLearningViewModel()
//    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack {
            if let image1 = viewModel.image1 {
                Image(uiImage: image1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            }
            if let image2 = viewModel.image2 {
                Image(uiImage: image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            }
        }
        // the .task basically performs the same way when running a task when a view appears
        // when using .task, no need to manually cancel the task, SwiftUI automatically takes care of that for us
        .task {
            await viewModel.fetchImage1()
        }
//        .onDisappear {
//            // basically cancels the task when the view disappears, so that it won't continue loading when not in sight.
//            fetchImageTask?.cancel()
//        }
        .onAppear {
            Task {
                // when doing something like this, the first await completes then it moves on to the second.
//                await viewModel.fetchImage1()
//                await viewModel.fetchImage2()
            }
            
            // to make both of them perform the action at the same time, you would need to place the asynchronous snippets in their own Tasks. Like this
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage1()
//            }
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
  
            
//            Task(priority: .low) {
//                print("Low: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .medium) {
//                print("Medium: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .high) {
//                print("High: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .background) {
//                print("Background: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .utility) {
//                print("Background: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .userInitiated) {
//                print("User initiated: \(Thread.current) : \(Task.currentPriority)")
//            }
            
            // Child tasks
            // child tasks inherit all the metadata from the parent tasks. Like if the parent is set to low, the priority of the child task will also be low
//            Task(priority: .low) {
//                print("User initiated: \(Thread.current) : \(Task.currentPriority)")
//                
////                Task {
////                    print("User initiated 2: \(Thread.current) : \(Task.currentPriority)")
////                }
//                
//                // if you want the child task to run at a different priority
//                // you either set the task with its own priority, or use the task detach.
//                // NEVER USE DETACHED, not recommended by Apple.
//                Task.detached {
//                    print("User initiated 2: \(Thread.current) : \(Task.currentPriority)")
//                }
//            }
            
            // Cancelling Tasks
//            self.fetchImageTask = Task {
//                await viewModel.fetchImage1()
//            }
        }
    }
}

#Preview {
    TaskLearning()
}
