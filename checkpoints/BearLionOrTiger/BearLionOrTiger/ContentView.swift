//
//  ContentView.swift
//  BearLionOrTiger
//
//  Created by Vedant Mistry on 01/02/24.
//

import SwiftUI
import CoreML
import PhotosUI
import Vision

struct ContentView: View {
    @EnvironmentObject var detectedAnimal: DetectedAnimal
    
    var body: some View {
        TabView {
            Camera()
                .tabItem {
                    Label("Camera", systemImage: "camera.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
