import SwiftyGif
import UIKit

class LunaGifViewController: UIViewController {
    @IBOutlet var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let gif = try UIImage(gifName: "FirstSlide.gif")
            self.myImageView.setGifImage(gif, loopCount: -1) // Will loop forever

            // Do any additional setup after loading the view.
        }
        catch {
            print("Couldn't load animated gif")
        }

        /*
         // MARK: - Navigation

         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
         }
         */
    }
}
