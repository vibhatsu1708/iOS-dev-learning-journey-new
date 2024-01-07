//MARK: - The createPlane takes a planeAnchor which is created here in the renderer.
func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
    guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
    let planeNode = createPlane(withPlaneAnchor: planeAnchor)
    
    node.addChildNode(planeNode)
}

func createPlane(withPlaneAnchor planeAnchor: ARPlaneAnchor) -> SCNNode {
    let plane = SCNPlane(width: CGFloat(planeAnchor.planeExtent.width), height: CGFloat(planeAnchor.planeExtent.height))
    let planeNode = SCNNode()
    planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0.0, z: planeAnchor.center.z)
    planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
    let gridMaterial = SCNMaterial()
    gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/plank.png")
    plane.materials = [gridMaterial]
    planeNode.geometry = plane
    
    return planeNode
}
