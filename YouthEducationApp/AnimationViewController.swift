import Lottie
import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        startAnimation()
        // Do any additional setup after loading the view.
        let logoAnimation = AnimationView(name: "confetti")
        logoAnimation.contentMode = .scaleAspectFit
        logoAnimation.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoAnimation)

        logoAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoAnimation.heightAnchor.constraint(equalToConstant: 400).isActive = true
        logoAnimation.widthAnchor.constraint(equalToConstant: 500).isActive = true
        logoAnimation.play()
        logoAnimation.play { _ in
            self.performSegue(withIdentifier: "TestSegway", sender: nil)
        }
    }
}

/*
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
 }
 */
