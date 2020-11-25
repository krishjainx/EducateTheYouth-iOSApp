//  QuotesViewController.swift

import Foundation
import LGButton
import SCLAlertView
import UIKit

class QuotesViewController: UIViewController, UINavigationControllerDelegate {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if self.traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = UIColor.green
            
        } else {
            self.view.backgroundColor = UIColor.systemOrange
        }
    }
    
    func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
            return nil
        }

        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return content.components(separatedBy: "\n")
        } catch _ as NSError {
            return nil
        }
    }
    
    var shuffled = [String]()
    var shuffledSpanish = [String]()
    
    @objc func generateNewNumber() {
        let alertView = SCLAlertView()
        
        if self.shuffled.count > 0 {
            let newQuote = self.shuffled.removeFirst()
            
            alertView.addButton("Learn more", target: self, selector: #selector(self.generateNewNumber))
            alertView.addButton("Aprender en español", target: self, selector: #selector(self.learninSpanish))
         
            alertView.showSuccess("Fact", subTitle: newQuote)
            
        } else {
            alertView.showSuccess("Well done", subTitle: "You're all caught up")
        }
    }
    
    @IBAction func startQuiz() {
        let QuoteVCToGame = "QuoteVCToGameVC"
        self.performSegue(withIdentifier: QuoteVCToGame, sender: self)
    }
        
    @objc func learninSpanish() {
        let alertView = SCLAlertView()
        
        if self.shuffledSpanish.count > 0 {
            let newQuote = self.shuffledSpanish.removeFirst()
            
            alertView.addButton("Learn more", target: self, selector: #selector(self.generateNewNumber))
            alertView.addButton("Aprender en español", target: self, selector: #selector(self.learninSpanish))
         
            alertView.showSuccess("Fact", subTitle: newQuote)
            
        } else {
            alertView.showSuccess("Bien hecho.", subTitle: "Están todos atrapados.")
        }
    }
        
    @IBAction func learning(_ sender: LGButton) {
        let factBank = self.arrayFromContentsOfFileWithName(fileName: "output")
        let factBankEsp = self.arrayFromContentsOfFileWithName(fileName: "outputesp")
        
        // Shuffle the quote array
        var items = factBank
        for _ in 0..<items!.count {
            let rand = Int.random(in: 0..<items!.count)
            self.shuffled.append(items![rand])
            items!.remove(at: rand)
        }
        
        // Shuffle spanish quotes array
        
        var itemsSpanish = factBankEsp
        for _ in 0..<itemsSpanish!.count {
            let rand = Int.random(in: 0..<itemsSpanish!.count)
            self.shuffledSpanish.append(itemsSpanish![rand])
            itemsSpanish!.remove(at: rand)
        }
        
        sender.isLoading = true
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            sender.isLoading = false
            self.generateNewNumber()
        }
    }
    
    @IBOutlet var instanceofLGButton: LGButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.instanceofLGButton.center.x = self.view.center.x
        
        if self.traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = UIColor(red: 44/255.0, green: 17/255.0, blue: 87/255.0, alpha: 1)

        } else {
            self.view.backgroundColor = UIColor.systemPurple
        }

        self.instanceofLGButton.addTarget(self, action: #selector(self.learning(_:)), for: .touchUpInside)
    }
}
