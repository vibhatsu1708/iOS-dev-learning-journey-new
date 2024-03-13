//
//  StateObjectAndObservableObject.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

//MARK: - Fruit Model
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
    let color: Color
}

//MARK: - Fruit View Model
class FruitViewModel: ObservableObject {
    @Published var fruits: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        fetchFruits()
    }
    
    func fetchFruits() {
        let fruit1: FruitModel = FruitModel(name: "Oranges", count: 4, color: .orange)
        let fruit2: FruitModel = FruitModel(name: "Watermelon", count: 3, color: .red)
        let fruit3: FruitModel = FruitModel(name: "Pears", count: 13, color: .green)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = true
            
            self.fruits.append(fruit1)
            self.fruits.append(fruit2)
            self.fruits.append(fruit3)
            
            self.isLoading = false
        }
    }
    func delete(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}

//MARK: - Main View
struct StateObjectAndObservableObject: View {
    
    // @StateObject, use this on creation or init.
    // @ObservedObject, use this on subviews.
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruits) { fruit in
                        HStack {
                            Text(fruit.name)
                                .fontWeight(.bold)
                            Spacer()
                            Text("No: \(fruit.count)")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .background(fruit.color)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        }
                    }
                    .onDelete(perform: { indexSet in
                        fruitViewModel.delete(index: indexSet)
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("My Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        NavigationLink(destination: SecondScreen(fruitViewModel: fruitViewModel)) {
                            Image(systemName: "arrow.right")
                        }
                    }
                }
            }
//            .onAppear {
//                fruitViewModel.fetchFruits()
//            }
        }
    }
}

//MARK: - Second Screen
struct SecondScreen: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruits)  { fruit in
                    Text(fruit.name)
                }
            }
        }
    }
}

//MARK: - Main View Preview
#Preview {
    StateObjectAndObservableObject()
}

//MARK: - Second Screen Preview
//#Preview {
//    SecondScreen()
//}
