import Foundation
import SpriteKit

class GameOverScene: SKScene {
  init(size: CGSize, won:Bool) {
    super.init(size: size)
   backgroundColor = SKColor.white
    

    let message = won ? "Education Won!" : "Try again"
    

    let label = SKLabelNode(fontNamed: "AmericanTypewriter")
    label.text = message
    label.fontSize = 40
    label.fontColor = SKColor.black
    label.position = CGPoint(x: size.width/2, y: size.height/2)
    addChild(label)
   

    run(SKAction.sequence([
      SKAction.wait(forDuration: 3.0),
      SKAction.run() { [weak self] in
        guard let `self` = self else { return }
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        let scene = GameScene(size: size)
        self.view?.presentScene(scene, transition:reveal)
      }
      ]))
  }
 
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
