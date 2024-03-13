//
//  LearningAppStorage.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 14/03/24.
//

import SwiftUI

struct LearningAppStorage: View {
//    @State var currentUserName: String? = nil
    
    // Using the newer SwiftUI AppStorage
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add name here")
            
            Button {
                let name = "Bruce"
                currentUserName = name
                // using the older user defaults
//                UserDefaults.standard.setValue(name, forKey: "name")
            } label: {
                Text("Save")
                    .textCase(.uppercase)
            }
        }
        
        // onAppear is required when saving using the older UserDefaults
//        .onAppear {
//            // using the older user defaults
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

#Preview {
    LearningAppStorage()
}
