//
//  ContentView.swift
//  gestures
//
//  Created by Vedant Mistry on 04/11/23.
//

import SwiftUI

struct ContentView: View {
    var views: [String: AnyView] = [
        "onTapGestureView": AnyView(onTapGestureView()),
        "onLongPressGestureView": AnyView(onLongPressGestureView()),
        "dragGestureView": AnyView(dragGestureView()),
        "magnificationGestureView": AnyView(magnificationGestureView()),
        "rotationGestureView": AnyView(rotationGestureView())
    ]
    
    var body: some View {
        VStack {
            NavigationStack {
                List(views.keys.sorted(), id: \.self) { key in
                    NavigationLink("\(key)", destination: views[key])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
