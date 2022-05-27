//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
  var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            updateUI()
    }

    @IBAction func answersButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
       // let actualQuestion = quiz[quesNum]
        //let actualAnswer = actualQuestion.ans
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor=UIColor.green
        }else{
            sender.backgroundColor=UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI() {
       /* if quesNum >= quiz.count {
            return
        }*/
        /*guard quiz.count < quesNum else{
            return}*/
        progressBar.progress = 0.0
        labelQuestion.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
    }
}
