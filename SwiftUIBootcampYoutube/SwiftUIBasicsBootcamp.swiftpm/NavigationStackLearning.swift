//
//  NavigationStackLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 17/03/24.
//

import SwiftUI

struct NavigationStackLearning: View {
    @State var searchableText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                
                ScrollView {
                    TextField("Search through", text: $searchableText)
                        .padding()
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    
                    Divider()
                        .background(Color.white)
                    
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundStyle(Color.black)
                            .frame(height: 200)
                            .padding()
                    }
                }
                
            }
            .navigationTitle("Toolbars")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "flame.fill")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "gearshape.fill")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "house.fill")
                }
            }
            .toolbarTitleMenu {
                Button("Button 1") {
                    
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    NavigationStackLearning()
}
