import UIKit
import ARKit
import SceneKit

//MARK: - Add this in view did load to see the yellow dots that visualise the planes depth.
self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

// Show statistics such as fps and timing information
sceneView.showsStatistics = true

//MARK: - To enable AR real world tracking configuration.
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()
    // Detecting the horizontal plane
    configuration.planeDetection = .horizontal
    // Run the view's session
    sceneView.session.run(configuration)
}

//MARK: - To be able to detect horizontal planes in AR.
func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    if anchor is ARPlaneAnchor {
        let planeAnchor = anchor as! ARPlaneAnchor
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode()
        planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
        let gridMaterial = SCNMaterial()
        gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
        plane.materials = [gridMaterial]
        planeNode.geometry = plane
        node.addChildNode(planeNode)
    } else {
        return
    }
}
