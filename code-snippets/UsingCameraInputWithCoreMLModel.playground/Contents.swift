import SwiftUI
import CoreML
import PhotosUI
import Vision

struct Camera: View {
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State private var image: UIImage?
    
    @EnvironmentObject var detectedAnimal: DetectedAnimal
    
    var body: some View {
        NavigationStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .frame(width: 400, height: 400)
                    .scaledToFit()
            } else {
                Rectangle()
                    .frame(width: 400, height: 400)
                    .foregroundStyle(Color.gray)
            }
            Text(detectedAnimal.detectedAnimal)
            .navigationTitle("Bear, Lion or Tiger")
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
    
    @EnvironmentObject var detectedAnimal: DetectedAnimal
    
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
        return Coordinator(picker: self, detectedAnimal: detectedAnimal)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ObservableObject {
    var picker: accessCameraView
    
    var detectedAnimal: DetectedAnimal
    
    init(picker: accessCameraView, detectedAnimal: DetectedAnimal) {
        self.picker = picker
        self.detectedAnimal = detectedAnimal
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
                self.detectedAnimal.detectedAnimal = firstResult.identifier
                
                print(self.detectedAnimal.detectedAnimal)
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
