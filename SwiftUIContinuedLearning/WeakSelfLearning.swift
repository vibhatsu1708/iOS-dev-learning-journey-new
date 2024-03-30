//
//  WeakSelfLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 31/03/24.
//

import SwiftUI

struct WeakSelfLearning: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigation", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay (
            Text("\(count ?? 0)")
                .padding()
                .font(.largeTitle)
                .background(Color.teal)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            ,alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var viewModel = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second view")
                .font(.largeTitle)
                .foregroundStyle(Color.orange)
            
            if let data = viewModel.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String?
    
    init() {
        print("initialised now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("deinitialised now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "new data"
        }
    }
}

#Preview {
    WeakSelfLearning()
}
