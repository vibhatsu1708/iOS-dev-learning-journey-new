//
//  RefreshableModifierLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 23/04/24.
//

import SwiftUI

// When using the refreshable modifier, mark the function which you are calling under the refreshable as async because the modifer is meant to work with async, so when you do do that, it will actually make the loading progress view linger around until that data is loaded giving a good effect for the data load, once the scrollview or list has been pulled down and let go.mmm

final class RefreshableModifierDataService {
    func getData() async throws -> [String] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return ["Apples", "Berries", "Bananas", "Oranges", "Pears"].shuffled()
    }
}

@MainActor
final class RefreshableModifierViewModel: ObservableObject {
    let manager = RefreshableModifierDataService()
    
    @Published private(set) var items: [String] = []
    
    func loadData() async {
        do {
            items = try await manager.getData()
        } catch {
            print(error)
        }
    }
}

struct RefreshableModifierLearning: View {
    @StateObject private var viewModel = RefreshableModifierViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.items, id: \.self) {
                        Text($0)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                }
                .padding()
            }
            .refreshable {
                await viewModel.loadData()
            }
            .task {
                await viewModel.loadData()
            }
            .navigationTitle("Refreshable fruits")
        }
    }
}

#Preview {
    RefreshableModifierLearning()
}
