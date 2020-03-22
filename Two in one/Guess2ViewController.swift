//
//  Guess2ViewController.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 22.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class Guess2ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var guessingNumberLabel: UILabel!
    private var tryNumber: Int = 1
    private var guessingNumber: Int = 500_000
    private var left: Int = 0
    private var right: Int = 1_000_000
    
    // MARK: - Public methods
     override func viewDidLoad() {
         super.viewDidLoad()
         
        setGuessingNumberLabelText()
     }
    
    // MARK: - Private methods
    private func setGuessingNumberLabelText() {
         guessingNumberLabel.text = "Is your number a \(guessingNumber)? \n Try number = \(tryNumber)"
    }
    
    @IBAction
    private func onBiggerButton() {
        left = guessingNumber + 1
        guessingNumber = (left + right) / 2
        tryNumber += 1
        
        setGuessingNumberLabelText()
    }
    
    @IBAction
    private func onLesserButton() {
        right = guessingNumber - 1
        guessingNumber = (left + right) / 2
        tryNumber += 1
        
        setGuessingNumberLabelText()
    }
    
    @IBAction
    private func onGuessedButton() {
        let alert = UIAlertController(title: "Congratulation", message: "Cheers!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
        
        reset()
    }
    
    private func reset() {
        tryNumber = 1
        guessingNumber = 500_000
        left = 0
        right = 1_000_000
        
        setGuessingNumberLabelText()
    }
    
}
