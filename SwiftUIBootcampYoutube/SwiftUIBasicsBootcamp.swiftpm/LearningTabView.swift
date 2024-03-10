//
//  LearningTabView.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 11/03/24.
//

import SwiftUI

struct LearningTabView: View {
    @State var selectedTab: Int =  0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Color.green)
                    .padding()
                Button {
                    selectedTab += 1
                } label: {
                    Text("next")
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                }
            }
                .tag(0)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Color.blue)
                    .padding()
                
                Button {
                    selectedTab += 1
                } label: {
                    Text("next")
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                }
            }
                .tag(1)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Color.orange)
                    .padding()
                
                Button {
                } label: {
                    Text("next")
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                }
            }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
//        TabView(selection: $selectedTab) {
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Label("Home", systemImage: "house.fill")
//                }
//                .tag(0)
//            
//            Text("Browse")
//                .tabItem {
//                    Label("Browse", systemImage: "globe")
//                }
//                .tag(1)
//            
//            Text("Profile")
//                .tabItem {
//                    Label("Profile", systemImage: "person.fill")
//                }
//                .tag(2)
//        }
//        .tint(Color.indigo)
    }
}

#Preview {
    LearningTabView()
}

struct HomeView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                Text("Home")
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Jump to profile")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
            }
        }
    }
}
