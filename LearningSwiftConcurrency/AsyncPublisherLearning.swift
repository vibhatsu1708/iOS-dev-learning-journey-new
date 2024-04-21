//
//  AsyncPublisherLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 22/04/24.
//

import Combine
import SwiftUI

class AsyncPublisherDataManager {
    @Published var myData: [String] = []
    
    func addData() async {
        self.myData.append("Apples")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        self.myData.append("Berries")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        self.myData.append("Bananas")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        self.myData.append("Watermelons")
    }
}

class AsyncPublisherViewModel: ObservableObject {
    let manager = AsyncPublisherDataManager()
    @MainActor @Published var dataArray: [String] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addFruits()
    }
    
    private func addFruits() {
        // using combine, it is a little difficult to use combine with Swift's async await concurrency.
//        manager.$myData
//            .receive(on: DispatchQueue.main, options: nil)
//            .sink { dataArray in
//                self.dataArray = dataArray
//            }
//            .store(in: &cancellables)
        
        
        
        // this is not like a regular for loop or a for each loop, since the values being looped over is an async publisher, this loop is not going to continuously execute, and instead you have to wait asynchronously for each of the values to come through, and when it comes through, then each of the times will the block be executed.
        Task {
            await MainActor.run {
                self.dataArray = ["Start"]
            }
            
            // this for loop is going to be waiting for the values from your publisher, because it never knows when this publisher is going to stop, so it is always going to be listening for the next value.
            // so "End" wont be added.
            // so to print the values after the loop, you either have to break out of the loop, or you would have to add two Tasks, from two different publishers that you want to listen to, like one task and the other separate task.
            // when you are waiting for these in the array, you are waiting forever for these publishers to publish values.
            for await value in manager.$myData.values {
                await MainActor.run {
                    self.dataArray = value
                }
            }
            
            await MainActor.run {
                self.dataArray = ["End"]
            }
        }

    }
    
    func start() async {
        await manager.addData()
    }
}

struct AsyncPublisherLearning: View {
    @StateObject var viewModel = AsyncPublisherViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.start()
        }
    }
}

#Preview {
    AsyncPublisherLearning()
}
