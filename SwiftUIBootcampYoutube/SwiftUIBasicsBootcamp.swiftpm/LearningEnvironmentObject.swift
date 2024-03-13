//
//  EnvironmentObject.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        self.dataArray.append(contentsOf: ["iphone", "macbook", "ipad", "airpods", "imac"])
    }
}

struct LearningEnvironmentObject: View {
    @StateObject var environmentViewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(environmentViewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }

                }
            }
            .navigationTitle("Apple devices")
        }
        .environmentObject(environmentViewModel)
    }
}

struct DetailView: View {
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .padding()
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .background(Color.white)
                    .clipShape(Capsule())
            }

        }
    }
}

struct FinalView: View {
    @EnvironmentObject var environmentViewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.indigo, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(environmentViewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    LearningEnvironmentObject()
}
