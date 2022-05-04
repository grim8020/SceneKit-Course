import UIKit
import SceneKit
import PlaygroundSupport

// How to create a live view in playgrounds
let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let scene = SCNScene()

sceneView.autoenablesDefaultLighting = false
//sceneView.allowsCameraControl = true
sceneView.scene = scene
sceneView.backgroundColor = UIColor.gray

PlaygroundPage.current.setLiveView(sceneView)


let cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(0, 3, 10)
scene.rootNode.addChildNode(cameraNode)
sceneView.pointOfView = cameraNode

//pyramid node
let torus = SCNNode()
torus.position = SCNVector3(0, 3, 0)
torus.geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.5)
torus.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
torus.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(torus)


let floor = SCNNode()
floor.geometry = SCNFloor()
floor.position = SCNVector3(0, 0, 0)
floor.geometry?.firstMaterial?.diffuse.contents = UIColor.darkGray
floor.geometry?.firstMaterial?.specular.contents = UIColor.white
scene.rootNode.addChildNode(floor)

let ambientLightNode = SCNNode()
ambientLightNode.light = SCNLight()
ambientLightNode.light?.type = SCNLight.LightType.ambient
scene.rootNode.addChildNode(ambientLightNode)

let omniDirectionalLightNode = SCNNode()
omniDirectionalLightNode.position = SCNVector3(0, 5, 10)
omniDirectionalLightNode.light = SCNLight()
omniDirectionalLightNode.light?.intensity = 1000
omniDirectionalLightNode.light?.type = SCNLight.LightType.omni
scene.rootNode.addChildNode(omniDirectionalLightNode)

let spotlightNode = SCNNode()
spotlightNode.position = SCNVector3(0, 10, 0)
spotlightNode.light = SCNLight()
spotlightNode.light?.intensity = 3000 //increase the intensity of a light
spotlightNode.light?.type = SCNLight.LightType.spot
spotlightNode.eulerAngles = SCNVector3(0 * CGFloat((Double.pi)/180.0), 0 * CGFloat((Double.pi)/180.0), 0 * CGFloat((Double.pi)/180.0))
scene.rootNode.addChildNode(spotlightNode)

//change the view
SCNTransaction.begin()
SCNTransaction.animationDuration = 3.0

spotlightNode.eulerAngles = SCNVector3(-90 * CGFloat((Double.pi)/180.0), 0 * CGFloat((Double.pi)/180.0), 0 * CGFloat((Double.pi)/180.0))
spotlightNode.position = SCNVector3(0, 15, 0)

SCNTransaction.commit()


