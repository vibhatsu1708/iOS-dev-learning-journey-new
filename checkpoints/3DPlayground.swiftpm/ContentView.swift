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
        let ARView = ARView()
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        ARView.session.run(configuration)

        return ARView
    }
    func updateUIView(_ uiView: ARView, context: Context) {
        guard let modelEntity = try? ModelEntity.load(named: "gramophone") else {
            print("Error loading model")
            return
        }
        let anchorEntity = AnchorEntity(plane: .horizontal)
        anchorEntity.addChild(modelEntity)
        uiView.scene.addAnchor(anchorEntity)
    }
}
