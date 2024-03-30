//
//  MultithreadingThreadsLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 30/03/24.
//

import SwiftUI

class BackgroundThreadsViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            // to check what thread you are on.
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                print("Check 1: \(Thread.isMainThread)")
                print("Check 1: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for i in 0..<100 {
            data.append("\(i)")
            print(data)
        }
        
        return data
    }
}

struct MultithreadingThreadsLearning: View {
    @StateObject var viewModel = BackgroundThreadsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.green)
                }
            }
        }
    }
}

#Preview {
    MultithreadingThreadsLearning()
}
