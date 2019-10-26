/*:
 # I.) An Into to Synthetic Polymers 👨‍🔬
 */
/*:
 ---
 ### Purpose 🤔:
 • The purpose of this playground is to explore synthetic polymers in organic chemistry, from a new perspective.
 
 • And to look where these polymers exist in everyday life.
 
 • To appeal to high-school senior chemistry students(just like me 🙋🏿‍♂️)
 
 */
/*:
 ---
 ### Tutorial 📚:
 • The Playground will operate by itself. And will display the next polymer automatically.
 
 • At the end of playground(At Polytetrafluoroethylene), the camera controls will enable, and you’ll be able to look around the scene.
 */
import SceneKit
import SpriteKit
import PlaygroundSupport


let view = SCNView(frame: NSRect(x: 0, y: 0, width: 1024, height: 768))

view.showsStatistics = false
view.backgroundColor = NSColor.black
PlaygroundPage.current.liveView = view
view.allowsCameraControl = false
/*:
 ---
 ### Import the model (Scene) & Configure Camera
 */
let scene = SCNScene(named: "bathroomScn.scn")

view.scene = scene
let camera = SCNCamera()
camera.usesOrthographicProjection = true
camera.orthographicScale = 9
camera.zNear = 0
camera.zFar = 100
var cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: -18.026, y: -90.998, z:140.603)
cameraNode.eulerAngles = SCNVector3(x: 70, y: 0, z:0)
cameraNode.camera?.zFar = 500
scene?.rootNode.addChildNode(cameraNode)
/*:
 ---
 ### Create Anchor Points for Animations
 */
let duckAnchor = SCNNode()
duckAnchor.position = SCNVector3(x: -22.029, y: 36.269, z: 58.777)

let pvcAnchor = SCNNode()
pvcAnchor.position = SCNVector3(x: -9.673, y: -49.828, z: 44.99)

let mirrorAnchor = SCNNode()
mirrorAnchor.position = SCNVector3(x: 36.487, y: 32.409, z: 101.23)

let lookAt = SCNLookAtConstraint(target: duckAnchor)
cameraNode.constraints = [lookAt]
view.pointOfView = cameraNode

/*:
 ---
 ### Create Rubber Ducky Animation 🐥
 */

let duckAnimOne = SCNAction.move(to: SCNVector3(x: 47.174, y: -42.368, z:112.694), duration: 2.0)
let duckAnimTwo = SCNAction.move(to: SCNVector3(x: 2.047, y: 18.539, z:68.363), duration: 2.0)
let duckAnimThree = SCNAction.rotate(by: -1.9, around: duckAnchor.position, duration: 0.5)
let duckAnimFour = SCNAction.move(to: SCNVector3(x: -16.743, y: 34.959, z:59.841), duration: 2.0)
let sequence = SCNAction.sequence([duckAnimOne, duckAnimTwo,  duckAnimThree, duckAnimFour])

cameraNode.runAction(sequence)
let synthPolyAnim = scene?.rootNode.childNode(withName: "synthPolymer", recursively: true)
let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360 * M_PI / 180), z: CGFloat(360 * M_PI / 180), duration: 15))
synthPolyAnim?.runAction(rotate)
/*:
 ---
 ### Create PVC ZoomPath & Animation 🜚
 */

DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    let pvcAnimOne = SCNAction.move(to: SCNVector3(x: 81.602, y: 3.456, z:113.044), duration: 2.0)
    let pvcAnimTwo = SCNAction.move(to: SCNVector3(x: 65.647, y: -72.144, z:110.706), duration: 2.0)
    let pvcAnimThree = SCNAction.move(to: SCNVector3(x: -17.301, y: -93.2, z:62.708), duration: 2.0)
    let pvcAnimFour = SCNAction.move(to: SCNVector3(x: -14.423, y: -87.374, z:41.376), duration: 2.0)
    let pvcAnimFive = SCNAction.move(to: SCNVector3(x: -10.649, y: -54.479, z:45.653), duration: 2.0)
    let pvcAnimSix = SCNAction.rotate(by: 1.9, around: duckAnchor.position, duration: 2.0)
    let pvcSequence = SCNAction.sequence([pvcAnimOne, pvcAnimTwo, pvcAnimThree, pvcAnimFour,pvcAnimSix, pvcAnimFive])
    

    let lookAtPvc = SCNLookAtConstraint(target: pvcAnchor)
    
    cameraNode.runAction(pvcSequence)
    cameraNode.constraints = [lookAtPvc]
    //anim node
    let pvcStructAnim = scene?.rootNode.childNode(withName: "pvcStruct", recursively: true)
    
    let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: CGFloat(360 * M_PI / 180), y: CGFloat(360 * M_PI / 180), z: 0, duration: 15))
    
    pvcStructAnim?.runAction(rotate)
}
/*:
 ---
 ### Create Mirror ZoomPath & Animation ⚗️
 
 */
 DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
    let mirAnimOne = SCNAction.move(to: SCNVector3(x: -16.113, y: -77.187, z:60.159), duration: 2.0)
    let mirAnimTwo = SCNAction.move(to: SCNVector3(x: -12.958, y: -47.554, z:76.809), duration: 2.0)
    let mirAnimThree = SCNAction.move(to: SCNVector3(x: 35.318, y: 19.196, z:101.464), duration: 2.0)
    let mirAnimFour = SCNAction.rotate(by: -1.2, around: mirrorAnchor.position, duration: 2.0)
    
    let mirrorSequence =  SCNAction.sequence([mirAnimOne, mirAnimTwo, mirAnimThree, mirAnimFour])
    let lookAtMirror = SCNLookAtConstraint(target: mirrorAnchor)
    cameraNode.runAction(mirrorSequence)
    cameraNode.constraints = [lookAtMirror]
    
    let mirStructAnim = scene?.rootNode.childNode(withName: "polytetra", recursively: true)
    
    let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(360 * M_PI / 180), z: CGFloat(360 * M_PI / 180), duration: 15))
    
    mirStructAnim?.runAction(rotate)
    
    view.allowsCameraControl = true
}
/*:
 ---
 ### Chemistry👩‍🔬 ➕  WWDC 2018  = ❤️
 • Thank You, to the people at Apple for giving me this opportunity.
 
 */
