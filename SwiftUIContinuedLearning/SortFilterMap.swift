//
//  SortFilterMap.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 22/03/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
//    let name: String
    let name: String? // for the compact map, if the name was an optional
    let points: Int
    let isVerified: Bool
}

class ViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredDataArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: nil, points: 3000, isVerified: true)
        let user2 = UserModel(name: "Bruce", points: 1200, isVerified: false)
        let user3 = UserModel(name: nil, points: 300, isVerified: true)
        let user4 = UserModel(name: "Thor", points: 2000, isVerified: false)
        let user5 = UserModel(name: "Clint", points: 3600, isVerified: true)
        let user6 = UserModel(name: "Peter", points: 3300, isVerified: true)
        let user7 = UserModel(name: nil, points: 1200, isVerified: false)
        let user8 = UserModel(name: "Wanda", points: 3080, isVerified: false)
        let user9 = UserModel(name: nil, points: 300, isVerified: true)
        let user10 = UserModel(name: "Stephen", points: 45000, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
        
        
    }
    func updateFilteredArray() {
        // sort
        /*
        // longer method
//        filteredDataArray = dataArray.sorted { user1, user2 in
//            user2.points < user1.points
//        }
        // shorter method
        filteredDataArray = dataArray.sorted(by: { $0.points < $1.points })
         */
        
        // fitler
        /*
//        filteredDataArray = dataArray.filter({ user in
//            user.isVerified
//        })
        filteredDataArray = dataArray.filter({ $0.isVerified })
         */
        
        // map
        /*
//        mappedArray = dataArray.map({ user -> String in
//            user.name
//        })
//        mappedArray = dataArray.map({ $0.name })
        // compact map
//        mappedArray = dataArray.compactMap({ user -> String? in
//            user.name ?? "No name"
//        })
        mappedArray = dataArray.compactMap({ $0.name ?? "no name" })
         */
        
        // combining all the three from above
        // longer method
        let sort = filteredDataArray.sorted(by: { $0.points > $1.points })
        let filter = sort.filter({ $0.isVerified })
        let map = filter.compactMap({ $0.name })
        
        // better method
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
    }
}

struct SortFilterMap: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.mappedArray, id: \.self) { user in
                    Text(user)
                        .font(.title)
                }
                
                
                
//                ForEach(viewModel.filteredDataArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        
//                        HStack {
//                            Text("Points: \(user.points)")
//                            
//                            Spacer()
//                            
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .padding()
//                    .foregroundStyle(Color.white)
//                    .background(Color.indigo)
//                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    SortFilterMap()
}
