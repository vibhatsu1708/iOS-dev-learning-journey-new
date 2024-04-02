//
//  AsyncAwaitKeywordsLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 02/04/24.
//

import SwiftUI

class AsyncAwaitViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
//    func addTitle1() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.dataArray.append("Title1: \(Thread.current)")
//        }
//    }
//    
//    func addTitle2() {
//        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
//            let title2 = "Title2: \(Thread.current)"
//            DispatchQueue.main.async {
//                self.dataArray.append(title2)
//                
//                let title3 = "Title3: \(Thread.current)"
//                self.dataArray.append(title3)
//            }
//        }
//    }
    
    func addAuthor1() async {
        // remeber to publish the UI changes on the main thread and not on the background thread, because Swift doesn't allow that. All UI changes must be done on the main thread.
        let author1 = "Author1: \(Thread.current)"
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let author2 = "Author2: \(Thread.current)"
        await MainActor.run {
            self.dataArray.append(author1)
            self.dataArray.append(author2)
            
            let author3 = "Author3: \(Thread.current)"
            self.dataArray.append(author3)
        }
        
        // every async function when called needs to preceed with await
        await addSomething()
    }
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run {
            let something1 = "Author2: \(Thread.current)"
            self.dataArray.append(something1)
            
            let something2 = "Author3: \(Thread.current)"
            self.dataArray.append(something2)
        }
    }
}

struct AsyncAwaitKeywordsLearning: View {
    @StateObject private var viewModel = AsyncAwaitViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataArray, id: \.self) { item in
                Text(item)
                    .font(.headline)
            }
        }
        .onAppear {
            Task {
                await viewModel.addAuthor1()
                
                let finalText = "Final text: \(Thread.current)"
                viewModel.dataArray.append(finalText)
            }
            
//            viewModel.addTitle1()
//            viewModel.addTitle2()
        }
    }
}

#Preview {
    AsyncAwaitKeywordsLearning()
}
