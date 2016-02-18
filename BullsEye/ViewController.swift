//
//  ViewController.swift
//  BullsEye
//
//  Created by Charlie Watson on 2/9/16.
//  Copyright © 2016 Fazeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels() {
            targetLabel.text = String(targetValue)
            scoreLabel.text = String(score)
            roundLabel.text = String(round)
    }
    
    
    
    func resetGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
@IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    let points = 100 - difference
    score += points
        
    let message = "The value of the slider is: \(currentValue)" + "\nYou scored \(points) points!!!"
    let alert = UIAlertController(title: "Congratulations!",
        message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK, thanks!", style: .Default, handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
    
    startNewRound()
    updateLabels()
    }
    
@IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
    }

    @IBAction func startOver() {
        resetGame()
        updateLabels()
    }
    
    @IBOutlet weak var targetLabel: UILabel!
    
    
}



