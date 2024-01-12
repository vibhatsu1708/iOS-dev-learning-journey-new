//
//  ViewController.swift
//  ARMeasure
//
//  Created by Vedant Mistry on 12/01/24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var dotNodes: [SCNNode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLocation = touches.first?.location(in: sceneView) {
            let hitTestResults = sceneView.hitTest(touchLocation, types: .featurePoint)
            if let hitResult = hitTestResults.first {
                addDot(atLocation: hitResult)
            }
        }
    }
    
    func addDot(atLocation hitResult: ARHitTestResult) {
        var allowedAddingDots: Bool = true
        
        if allowedAddingDots {
            let dotGeometry = SCNSphere(radius: 0.005)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.white
            dotGeometry.materials = [material]
            
            let dotNode = SCNNode(geometry: dotGeometry)
            
            dotNode.position = SCNVector3(x: hitResult.worldTransform.columns.3.x, y: hitResult.worldTransform.columns.3.y, z: hitResult.worldTransform.columns.3.z)
            
            sceneView.scene.rootNode.addChildNode(dotNode)
            
            dotNodes.append(dotNode)
            
            if dotNodes.count == 2 {
                allowedAddingDots = false
            }
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIBarButtonItem) {
        if dotNodes.count == 2 {
            calculate()
        } else {
            print("Not enough dots")
        }
    }
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        for dot in dotNodes {
            dot.removeFromParentNode()
        }
        dotNodes.removeAll()
        sceneView.scene.rootNode.enumerateChildNodes { node, stop in
            node.removeFromParentNode()q
        }
    }
    
    func calculate() {
        let start = dotNodes[0]
        let end = dotNodes[1]
        let x = Double(end.position.x - start.position.x)
        let y = Double(end.position.y - start.position.y)
        let z = Double(end.position.z - start.position.z)
        
        let distance = sqrt((x*x) + (y*y) + (z*z))
        
        updateText(text: String(format: "%.2f", distance), endPoint: end.position)
    }
    
    func updateText(text: String, endPoint: SCNVector3) {
        let textGeometry = SCNText(string: text, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.white
        let textNode = SCNNode(geometry: textGeometry)
        textNode.position = SCNVector3(x: endPoint.x, y: endPoint.y + 0.01, z: endPoint.z)
        textNode.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
        
        sceneView.scene.rootNode.addChildNode(textNode)
    }
    

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
