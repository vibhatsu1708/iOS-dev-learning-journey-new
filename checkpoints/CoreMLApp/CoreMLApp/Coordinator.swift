//
//  Coordinator.swift
//  CoreMLApp
//
//  Created by Vedant Mistry on 03/02/24.
//

import CoreML
import SwiftUI
import UIKit
import Vision

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
        guard let model = try? VNCoreMLModel(for: BearLionTigerClassifierCreateML().model) else {
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
