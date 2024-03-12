//
//  usingIfLetGuardLet.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 13/03/24.
//

import SwiftUI

struct usingIfLetGuardLet: View {
    @State var currentUserID: String? = nil
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Practicing safe coding using if let and guard let!")
                
                // this is how it should be done
                if let displayText {
                    Text(displayText)
                        .font(.title)
                }
                
                // do not use force unwrap ever, unless you are 100% sure that there will always be a value.
//                Text(displayText!)
//                    .font(.title)
                
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            
            .navigationTitle("SafeCoding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This data is only visible with non nil currentUserID. currentUserID: (\(currentUserID)) Done using if let"
                isLoading = false
            }
        } else {
            displayText = "Error, please login!"
        }
    }
    
    func loadData2() {
        guard let currentUserID else {
            displayText = "Error, please login!"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This data is only visible with non nil currentUserID. currentUserID: (\(currentUserID)) Done using guard let"
            isLoading = false
        }
    }
}

#Preview {
    usingIfLetGuardLet()
}
