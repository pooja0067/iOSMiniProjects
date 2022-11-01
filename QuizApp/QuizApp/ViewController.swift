//
//  ViewController.swift
//  QuizApp
//
//  Created by Pooja Patil on 27/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizarray = [questions(question: "Reading books is Ravi's biggest hobby", ans: "True"),
                     questions(question: "Favorite animal is an Elephant?", ans: "True"),
                     questions(question: "Planting the trees and fully taking care of trees :(", ans: "True")]
    
    var noOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
    }
    
    
    @IBAction func answerAction(_ sender: UIButton) {
        let userAns = sender.currentTitle ?? "wrong data"
        let crtAns = quizarray[noOfQuestions].ans
        
        if userAns == crtAns {
           sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        if noOfQuestions < quizarray.count - 1 {
        noOfQuestions += 1
        } else {
            noOfQuestions = 0
        }
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateQuestion) , userInfo: self, repeats: true)
    }
    
    
    @objc func updateQuestion() {
        questionLabel.text = quizarray[noOfQuestions].question
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressView.progress = Float(noOfQuestions + 1)/Float(quizarray.count)
    }
    

}

