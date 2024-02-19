//
//  Camera.swift
//  CoreMLApp
//
//  Created by Vedant Mistry on 25/12/23.
//

import SwiftUI
import CoreML
import Vision
import PhotosUI

struct Camera: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    
    @EnvironmentObject var detectedObject: DetectedObject
    
    var body: some View {
        NavigationStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No image")
            }
            Text("\(detectedObject.object)")
            .navigationTitle("CameraML")
            .toolbar {
                Button {
                    self.showCamera.toggle()
                } label: {
                    Image(systemName: "camera.fill")
                }
                .fullScreenCover(isPresented: self.$showCamera) {
                    accessCameraView(selectedImage: self.$selectedImage)
                }
            }
        }
    }
}

struct accessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    @EnvironmentObject var detectedObject: DetectedObject
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self, detectedObject: detectedObject)
    }
}
