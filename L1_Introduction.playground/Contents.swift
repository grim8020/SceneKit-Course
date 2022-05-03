import UIKit
import SceneKit
import PlaygroundSupport

// How to create a live view in playgrounds
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let scene = SCNScene()

sceneView.scene = scene
sceneView.backgroundColor = UIColor.lightGray
sceneView.autoenablesDefaultLighting = true

PlaygroundPage.current.setLiveView(sceneView)

let torus = SCNNode()
torus.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5)
torus.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
torus.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(torus)

//if you want to remove something from the node use the following:
    
    //torus.removeFromParentNode()

let action = SCNAction.rotate(by: 90 * CGFloat((Double.pi)/180.0), around: SCNVector3(1, 0, 0), duration: 3)
torus.runAction(action)
