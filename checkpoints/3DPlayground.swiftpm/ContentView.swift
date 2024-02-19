import ARKit
import RealityKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        ARContainer()
    }
}

struct ARContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let ARView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        let mesh = MeshResource.generateBox(size: 0.2)
        let material = SimpleMaterial(color: .blue, roughness: 0.5, isMetallic: true)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        let anchorEntity = AnchorEntity(plane: .horizontal)
        anchorEntity.addChild(modelEntity)
        ARView.scene.addAnchor(anchorEntity)
        
        // To generate collision shapes (needed for gestures)
        modelEntity.generateCollisionShapes(recursive: true)
        
        // To install the gestures
        ARView.installGestures([.translation, .rotation, .scale], for: modelEntity)
        
        
        return ARView
    }
    func updateUIView(_ uiView: ARView, context: Context) {}
}
