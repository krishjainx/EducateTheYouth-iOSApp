import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    @objc func back(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: false)
        navigationController?.hidesBarsOnTap = false
    }
   

    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)

        let vc1 = sb.instantiateViewController(identifier: "1")
        let vc2 = sb.instantiateViewController(identifier: "2")
        let vc3 = sb.instantiateViewController(identifier: "3")
        let vc4 = sb.instantiateViewController(identifier: "4")
        let vc5 = sb.instantiateViewController(identifier: "5")
        let vc6 = sb.instantiateViewController(identifier: "6")
        return [vc1, vc2, vc3, vc4, vc5, vc6]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self

        if let firstViewController = viewControllerList.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
           self.navigationItem.title = "Importance of education"
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewControllerList.count > previousIndex else { return nil }
        return viewControllerList[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil }
        return viewControllerList[nextIndex]
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        let config = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)
        let backButton = UIButton(type: .custom)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.setImage(image, for: .normal)
        backButton.setTitle("Main Menu", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
   
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = "Importance of education"
    }
}
