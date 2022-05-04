import UIKit
import SceneKit
import PlaygroundSupport

// How to create a live view in playgrounds
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let scene = SCNScene()

sceneView.scene = scene
sceneView.backgroundColor = UIColor.black
sceneView.autoenablesDefaultLighting = true

PlaygroundPage.current.setLiveView(sceneView)

//Node -> change with the node.geometry
let node = SCNNode()
node.geometry = SCNSphere(radius: 1)
node.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "diffuse copy.png") //UIImage(named: "diffuse.png" --> didnt wor
node.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "specular copy.png")
node.geometry?.firstMaterial?.emission.contents =
#imageLiteral(resourceName: "emission_good copy.png")
node.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "normal copy.png")
    //shows 3D features - doesnt show up becuase of the picture resolution

//node.geometry?.firstMaterial?.multiply.contents = UIColor.purple

//node.geometry?.firstMaterial?.transparency = 0.2

//node.geometry?.firstMaterial?.shininess = 30

scene.rootNode.addChildNode(node)

let action = SCNAction.rotate(by: 90 * CGFloat((Double.pi)/180.0), around: SCNVector3(0, -1, 0), duration: 3)
let repeatAction = SCNAction.repeatForever(action)
node.runAction(repeatAction)
