import PMAlertController
import SpriteKit
import UIKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {
    @objc func back(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func backSwipe() {
        let controllersInNavigationCount = self.navigationController?.viewControllers.count
        self.navigationController?.popToViewController(self.navigationController?.viewControllers[controllersInNavigationCount! - 3] as! ViewController, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let alert = UIAlertController(title: "Learn to play", message: "Tap in the direction you want to shoot the missile. Don't let a single ghost go past the books. Slide back to go back.", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
    
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let alert = UIAlertController(title: "Learn to play", message: "Tap in the direction you want to shoot the missile. Don't let a single ghost go past the books. Slide back to go back.", preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//
//
//    alert.view.tintColor = UIColor.systemRed
    
        let alertVC = PMAlertController(title: "Learn to play", description: "Tap in the direction you want to shoot the missile. Don't let a single ghost go past the books. Slide back to go back.", image: UIImage(named: "consoleGamebg.jpg"), style: .alert)

        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
            print("Capture action OK")
        }))

        self.present(alertVC, animated: true, completion: nil)
    }
  
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.hidesBackButton = true
        let config = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self, action: #selector(self.back), for: .touchUpInside)
        backButton.setImage(image, for: .normal)
        backButton.setTitle("Main Menu", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
