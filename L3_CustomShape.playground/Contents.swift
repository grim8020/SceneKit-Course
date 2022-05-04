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

//draws out the shape bath
let path = UIBezierPath()
path.move(to: CGPoint(x:0, y:0))
path.addLine(to: CGPoint(x:2, y:1))
path .addLine(to: CGPoint(x:2, y:0))
path.close()

//SCNShape

let shape = SCNShape(path: path, extrusionDepth: 0.2)




//Node -> change with the node.geometry
let node = SCNNode()
node.geometry = shape
node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
node.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(node)

//if you want to remove something from the node use the following:
    
    //torus.removeFromParentNode()

//let action = SCNAction.rotate(by: 90 * CGFloat((Double.pi)/180.0), around: SCNVector3(1, 0, 0), duration: 3)
//let repeatAction = SCNAction.repeatForever(action)
//node.runAction(repeatAction)
