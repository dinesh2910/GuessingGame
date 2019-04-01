//
//  ViewController.swift
//  GuessingGame
//
//  Created by dinesh danda on 3/28/19.
//  Copyright © 2019 Dinesh Danda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var randomLabel:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    var currentValue: Int = 0
    var randomValue: Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(slider.value)
        startNewGame()
        
    }

    @IBAction func hitMebtn(){
        let difference = abs(randomValue - currentValue)
        var points = 100 - difference
        score += points
        
        let title:String
        if difference == 0{
            title = "Perfect!"
            points += 100
        } else if difference == 5{
            title = "You are almost Close!"
            points += 90
        } else if difference == 10{
            title = "Good try.."
            points += 50
        } else {
            title = "You are not even close"
            points += 0
        }
        let message = "The Score is \(points) Points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {action in self.startNewRound()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func SliderValue(_ slider:UISlider) {
        //print("The Value of Slider is: \(slider.value)")
        let roundedValue = slider.value.rounded()
        print("The Rounded Value is: \(roundedValue)")
        currentValue = Int(slider.value)
    }
    func startNewRound(){
        round += 1
        randomValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        targetLabel()
    }
    func targetLabel(){
        randomLabel.text = String(randomValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    @IBAction func startNewGame(){
        round = 0
        score = 0
        startNewRound()
    }
}


