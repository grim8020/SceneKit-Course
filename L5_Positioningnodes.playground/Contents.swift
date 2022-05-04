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


//SCNPyramid





//pyramid node
let pyramid = SCNNode()
pyramid.geometry = SCNPyramid(width: 1, height: 1, length: 1)
pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(pyramid)

//box node
let box = SCNNode()
box.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
box.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
box.position = SCNVector3(0, -0.5, 0)
//have box a child of pyramid so they move together
pyramid.addChildNode(box)

let floor = SCNNode()
floor.position = SCNVector3(0, -5, 0)
floor.geometry = SCNFloor()
floor.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(floor)

//change the view
SCNTransaction.begin()
SCNTransaction.animationDuration = 3.0

pyramid.position = SCNVector3(0, 1, -10)
pyramid.rotation = SCNVector4(1, 2, 4, -20)

pyramid.eulerAngles = SCNVector3(45 * CGFloat((Double.pi)/180.0)/*rotate along the x axis only --> this is the formula used*/, 45 * CGFloat((Double.pi)/180.0), 0)

SCNTransaction.commit()


