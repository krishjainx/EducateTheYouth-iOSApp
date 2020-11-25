//  Detail2ViewController.swift
import UIKit
class Detail2ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        OperationQueue().addOperation {
            if let image = UIImage(named: "\(Bundle.main.resourcePath!)/Images" + "/" + (self.imageName ?? "")) {
                OperationQueue.main.addOperation {
                    self.imageView.image = image
                }
            }
        }
        
        if imageName == "fdf.jpg" {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "sea.jpg")
            backgroundImage.contentMode = UIImageView.ContentMode.scaleAspectFill
            view.insertSubview(backgroundImage, at: 0)
        } else {
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "janbg.jpg")
            backgroundImage.contentMode = UIImageView.ContentMode.scaleAspectFill
            view.insertSubview(backgroundImage, at: 0)
        }
    }
}

class Detail2PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var selectedImage: String?
    var entirePictures = [String]()
    var currentPosition: Int = 0
    var pages = [UIViewController]()
    let factoryStoryboard = UIStoryboard(name: "Main", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        pages = createPages()
        updateTitle(label: entirePictures[currentPosition])
        setViewControllers([pages[currentPosition]], direction: .forward, animated: true, completion: nil)
    }
    
    func createPages() -> [UIViewController] {
        var pageviewControllers = [UIViewController]()
        for index in 0 ..< entirePictures.count {
            //            pageviewControllers.append(createDetail2ViewController(index: index)!)
            if index == 4 {
                pageviewControllers.append(createGameVC(index: index)!)
            } else if index == 5 {
                pageviewControllers.append(createCarouselVC(index: index)!)
            } else if index == 6 {
                pageviewControllers.append(createQuoteVC(index: index)!)
            } else {
                pageviewControllers.append(createDetail2ViewController(index: index)!)
            }
        }
        return pageviewControllers
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = pages.firstIndex(of: viewController) ?? (entirePictures.count - 1)
        index += 1
        if index >= entirePictures.count {
            return nil
        }
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = pages.firstIndex(of: viewController) ?? 0
        index -= 1
        if index < 0 {
            return nil
        }
        return pages[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if pages.firstIndex(of: pendingViewControllers[0]) == 5 {
            navigationItem.title = "Game"
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed,
            let lastVC: UIViewController? = previousViewControllers[0]
        { if pages.firstIndex(of: lastVC!) == 4 {
            customTextTitle(customText: "Importance of education")
        } else if pages.firstIndex(of: lastVC!) == 5 {
            customTextTitle(customText: "Quiz")
            
        } else {
            if completed,
                let currentViewController = viewControllers?.first as? Detail2ViewController
            {
                updateTitle(label: currentViewController.imageName)
            }
        }
        }
    }
    
    func customTextTitle(customText: String?) {
        navigationItem.title = customText
    }
    
    func updateTitle(label: String?) {
        navigationItem.title = (label! as NSString).deletingPathExtension
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        //        navigationController?.navigationBar.barTintColor = UIColor.black
        //        navigationController?.view.backgroundColor = .blue
    }
    
    func createDetail2ViewController(index: Int) -> Detail2ViewController? {
        guard let viewController = factoryStoryboard.instantiateViewController(withIdentifier: "Detail2VCID") as? Detail2ViewController else {
            return nil
        }
        viewController.imageName = entirePictures[index]
        return viewController
    }
    
    func createGameVC(index: Int) -> GameViewController? {
        guard let viewController = factoryStoryboard.instantiateViewController(withIdentifier: "IDForGame") as? GameViewController else {
            return nil
        }
        return viewController
    }
    
    func createCarouselVC(index: Int) -> RootPageViewController? {
        guard let viewController = factoryStoryboard.instantiateViewController(withIdentifier: "IDForCarousel") as? RootPageViewController else {
            return nil
        }
        
        return viewController
    }
    
    func createQuoteVC(index: Int) -> QuotesViewController? {
        guard let viewController = factoryStoryboard.instantiateViewController(withIdentifier: "QuoteVCID") as? QuotesViewController else {
            return nil
        }
        return viewController
    }
}
