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
    @EnvironmentObject var detectedObject: DetectedObject
    
    var body: some View {
        TabView {
            Gallery()
                .tabItem {
                    Label("Gallery", systemImage: "photo.stack")
                }
            Camera()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
        }
    }
}

#Preview {
    ContentView()
}
