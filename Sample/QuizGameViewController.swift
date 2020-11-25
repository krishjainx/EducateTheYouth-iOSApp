//
//  QuizGameViewController.swift
//  Sample Marbella
//
//  Created by KRISH JAIN on 06/11/2020.
//

import UIKit

class QuizGameViewController: UIViewController, UINavigationControllerDelegate {
    @IBOutlet var headerview: UIView!
    @IBOutlet var buttonsview: UIView!
    @IBOutlet var questionCounter: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var progressView: UIView!
    @IBOutlet var questionImage: UIImageView!
    @IBOutlet var questionLabel: UILabel!
    
    
    //Outlet for buttons
    
    @IBOutlet var optionA: UIButton!
    
    @IBOutlet var optionB: UIButton!
    @IBOutlet var optionC: UIButton!
    
    @IBOutlet var optionD: UIButton!
    @IBOutlet var widthConstraint: NSLayoutConstraint!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //round button corner
        
        optionA.layer.cornerRadius = 20
        optionB.layer.cornerRadius = 20
        optionC.layer.cornerRadius = 20
        optionD.layer.cornerRadius = 20
        
        questionImage.layer.cornerRadius = 20
        
        updateQuestion()
        updateUI()
        
        
        
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.hidesBarsOnTap = false
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.navigationBar.isHidden = true
//        self.view.backgroundColor = UIColor.systemGreen
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "stars.jpg")!)
        self.headerview.backgroundColor = UIColor(patternImage: UIImage(named: "stars.jpg")!)
        self.buttonsview.backgroundColor = UIColor(patternImage: UIImage(named: "astronomy.jpg")!)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        
//        if sender.tag == 1 {
//            print("option a")
//
//        } else if sender.tag == 2 {
//
//            print("option b")
//        } else if sender.tag == 3 {
//            print("option c")
//
//        } else {
//
//            print("option d")
//        }
        
//        print(sender.tag)
        
        if sender.tag == selectedAnswer {
            
            print("correct")
            score += 1
            
        } else {
            
            print("oops")
            
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func updateQuestion() {
        
//        questionImage.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
//        questionLabel.text = allQuestions.list[questionNumber].question
//        optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
//        optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
//        optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
//        optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
//        selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        
        
        if questionNumber < allQuestions.list.count - 1 {
            
//            questionNumber += 1
            
            questionImage.image = UIImage(named:(allQuestions.list[questionNumber].questionImage))
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
            
        } else {
            
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
      
        updateUI()
        
    }
    
    func restartQuiz() {
        
        score = 0
        questionNumber = 0
        updateQuestion()
    
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
//       progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
//        widthConstraint = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
        widthConstraint.constant = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        progressView.layoutIfNeeded()
}
    
    
}
