//
//  CustomDataModels.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followersCount: Int
    let isVerfied: Bool
}

struct CustomDataModels: View {
    @State var users: [UserModel] = [
        UserModel(displayName: "Tony", userName: "Ironmanroxx", followersCount: 1200, isVerfied: true),
        UserModel(displayName: "Bruce", userName: "Hulkgosmash", followersCount: 999, isVerfied: true),
        UserModel(displayName: "Thor", userName: "Lightningman", followersCount: 1169, isVerfied:
                 false),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    HStack(spacing: 10) {
                        Circle()
                            .frame(height: 30)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(user.displayName)
                                    .font(.headline)
                                if user.isVerfied {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundStyle(Color.blue)
                                }
                            }
                            Text("@\(user.userName)")
                                .font(.callout)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "person.3.fill")
                            Text("\(user.followersCount)")
                                .font(.headline)
                        }
                    }
                    .padding(.vertical, 10)
                }
                
//                ForEach(users, id: \.self) { user in
//                    HStack(spacing: 10) {
//                        Circle()
//                            .frame(height: 30)
//                        Text(user)
//                    }
//                    .padding(.vertical, 10)
//                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    CustomDataModels()
}
