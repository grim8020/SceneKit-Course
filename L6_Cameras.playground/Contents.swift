import UIKit
import SceneKit
import PlaygroundSupport

// How to create a live view in playgrounds
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let scene = SCNScene()

sceneView.autoenablesDefaultLighting = true
//sceneView.allowsCameraControl = true
sceneView.scene = scene
sceneView.backgroundColor = UIColor.gray

PlaygroundPage.current.setLiveView(sceneView)


let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(0, 0, 10)
scene.rootNode.addChildNode(cameraNode)
sceneView.pointOfView = cameraNode

//pyramid node
let pyramid = SCNNode()
pyramid.geometry = SCNPyramid(width: 1, height: 1, length: 1)
pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(pyramid)


let floor = SCNNode()
floor.geometry = SCNFloor()
floor.position = SCNVector3(0, 0, 0)
floor.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
floor.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(floor)

//change the view
SCNTransaction.begin()
SCNTransaction.animationDuration = 3.0

cameraNode.position = SCNVector3(0, 5, 5)
cameraNode.eulerAngles = SCNVector3(-45 * CGFloat((Double.pi)/180.0), 0, 0)

SCNTransaction.commit()


