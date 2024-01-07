override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let location = touches.first?.location(in: sceneView) else {
        return
    }
    guard let query = sceneView.raycastQuery(from: location, allowing: .estimatedPlane, alignment: .horizontal) else {
        return
    }
    guard let result = sceneView.session.raycast(query).first else {
        return
    }
    let ship = SCNScene(named: "art.scnassets/ship.scn")!
    if let shipNode: SCNNode = ship.rootNode.childNode(withName: "ship", recursively: true) {
        shipNode.transform = SCNMatrix4(result.worldTransform)
        sceneView.scene.rootNode.addChildNode(shipNode)
    }
}
