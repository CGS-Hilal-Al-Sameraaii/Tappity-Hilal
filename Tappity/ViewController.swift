//
//  ViewController.swift
//  Tappity
//
//  Created by Hilal Alsameraaii on 30/5/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var time: UILabel!
    @IBOutlet var score: UILabel!
    
    var gameRunning = false
    var timeValue = 30
    var scoreValue = 0
    
    var colors = [UIColor.red, UIColor.black, UIColor.yellow, UIColor.orange, UIColor.green, UIColor(red: 0, green: 61/255, blue: 161/255, alpha: 1), UIColor.gray, UIColor.purple, UIColor.magenta, UIColor.blue]
    
    @IBAction func buttonPress(sender: UIButton) {
        if (gameRunning == false) {
            gameRunning = true
            scoreValue = 0
            timeValue = 30
            countDown()
        }
        
        scoreValue += 1
        score.text = String(scoreValue)
        self.view.backgroundColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
    }
    
    func coolFeatureTesting() {
        print("hey hilla just testing this new cool feature")
    }
    
    func countDown() {
        timeValue -= 1
        time.text = String(timeValue)
        
        if (timeValue != 0) {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
                self.countDown()
            }
        } else {
            gameRunning = false
            
            let gameOver = UIAlertController(title: "Game Over", message: "Your score is: \(scoreValue)", preferredStyle: UIAlertControllerStyle.actionSheet)
            gameOver.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(gameOver, animated: true)
        }
    }
    
}

