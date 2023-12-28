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

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ObservableObject {
    var picker: accessCameraView
    
    var detectedObject: DetectedObject
    
    init(picker: accessCameraView, detectedObject: DetectedObject) {
        self.picker = picker
        self.detectedObject = detectedObject
        super.init()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        guard let ciImage = CIImage(image: selectedImage) else {
            fatalError("Error while processing image.")
        }
        
        detectInImage(image: ciImage)
        
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
    func detectInImage(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML model failed.")
        }
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            if let firstResult = results.first {
                self.detectedObject.object = firstResult.identifier
                
                print(self.detectedObject.object)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print("\(error)")
        }
    }
}
