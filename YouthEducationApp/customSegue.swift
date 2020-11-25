import UIKit

class customSegue: UIStoryboardSegue {
    override func perform() {
        guard let navigationController = source.navigationController else {
            source.present(destination, animated: true, completion: nil)
            return
        }

        let viewControllers = Array(navigationController.viewControllers.dropLast() + [destination])
        navigationController.setViewControllers(viewControllers, animated: true)
    }
}
