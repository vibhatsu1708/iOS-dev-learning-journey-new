//
//  ContentView.swift
//  CoreMLApp
//
//  Created by Vedant Mistry on 25/12/23.
//

import SwiftUI
import CoreML
import Vision
import PhotosUI

struct ContentView: View {
    @ObservedObject var coordinator: Coordinator
    
    init() {
        self.coordinator = Coordinator(picker: accessCameraView(selectedImage: $coordinator.selectedImage))
    }

    
    var body: some View {
        TabView {
            Gallery()
                .tabItem {
                    Label("Gallery", systemImage: "photo.stack")
                }
            Camera(coordinator: coordinator)
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
        }
    }
}

#Preview {
    ContentView()
}
