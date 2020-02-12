//
//  ViewController.swift
//  Quizzler
//
//  Created by maJor on 08/02/2020.
//  Copyright © 2020 maJor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    var allQuestion = QuestionBank()
    var pickedAns:Bool = false
    var counter:Int = 0
    var score:Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAns = true
            
        }else{
            pickedAns = false
            
        }
        
        checkAnswer()
        counter += 1
        nextQuestion()
  
    }
    
        func updateUI() {
            scoreLabel.text = "Score: \(score)"
            progressLabel.text = "\(counter+1)/13"
            progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(counter)
           }
    

    func nextQuestion() {
        if counter < 13{
            questionLabel.text = allQuestion.list[counter].questionText
            updateUI()
        }else{
            let alert = UIAlertController(title: "Awesome", message: "You have finished all question .Whould you like to Restart? ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            present(alert,animated: true,completion: nil)
        }
        
              }
    
    
    func checkAnswer() {
        if pickedAns == allQuestion.list[counter].ans{
            score += 1
            ProgressHUD.showSuccess("Correct!")
        }else{
            ProgressHUD.showError("Wrong!")
            
        }
        
    }
    
    
    func startOver() {
        counter = 0
        score = 0
        questionLabel.text = allQuestion.list[counter].questionText
        updateUI()
       
    }
    

    
}
