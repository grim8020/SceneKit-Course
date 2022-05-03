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

//SCNBox
let box = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0.0)

//SCN Capsule
let capsule = SCNCapsule(capRadius: 0.5, height: 2)

//SCNCone
let cone = SCNCone(topRadius: 0, bottomRadius: 1, height: 2)

//SCNCylinder
let cylinder = SCNCylinder(radius: 1, height: 2)

//SCNFloor
    //future lesson
//SCNPlane
let plane = SCNPlane(width: 1, height: 1)
    //node.geometry?.firstMaterial?.doubleSided = true
    //shows both sides of a plane

//SCNPyramid
let pyramid = SCNPyramid(width: 1, height: 1, length: 1)

//SCNShape
    //future lesson

//SCNSphere
let sphere = SCNSphere(radius: 1)

//SCNText
let text = SCNText(string: "Hello", extrusionDepth: 10)

//SCNTorus
let torus = SCNTorus(ringRadius: 1, pipeRadius: 0.5)

//SCNTube
let tube = SCNTube(innerRadius: 0.5, outerRadius: 1, height: 1)


//Node -> change with the node.geometry
let node = SCNNode()
node.geometry = text
node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
node.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(node)

//if you want to remove something from the node use the following:
    
    //torus.removeFromParentNode()

let action = SCNAction.rotate(by: 90 * CGFloat((Double.pi)/180.0), around: SCNVector3(0, 1, 0), duration: 3)
let repeatAction = SCNAction.repeatForever(action)
node.runAction(repeatAction)
