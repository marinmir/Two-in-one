//
//  Guess1ViewController.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 22.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class Guess1ViewController: UIViewController {
    
    // MARK: - Properties
    var recordHistory: RecordsHistory?
    
    @IBOutlet private var inputNumberTextField: UITextField!
    @IBOutlet private var triesLabel: UILabel!
    
    private var randomNumber: Int = 0
    private var tryCount: Int = 0
    
    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeRandomNumber()
        setTriesLabelText()
    }
    
    // MARK: - Private methods
    private func makeRandomNumber() {
        randomNumber = Int.random(in: 1...1_000_000)
    }
    
    private func reset() {
        tryCount = 0
        makeRandomNumber()
        setTriesLabelText()
        inputNumberTextField.text = ""
    }
    
    private func setTriesLabelText() {
        triesLabel.text = "Your try number is \(tryCount)"
    }
    
    private func checkInput(userNumber number: Int) {
        var alert: UIAlertController!
        
        if number == randomNumber {
            alert = UIAlertController(title: "Congratulation", message: "Guessed!", preferredStyle: .alert)
            
            recordHistory?.guess1Records.append(RecordModel(triesCount: tryCount, guessedNumber: randomNumber))
            reset()
        } else {
            if number > randomNumber {
                alert = UIAlertController(title: "Try again", message: "Try lesser one", preferredStyle: .alert)
            } else {
                alert = UIAlertController(title: "Try again", message: "Try bigger one", preferredStyle: .alert)
            }
            
            tryCount += 1
            setTriesLabelText()
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction private func didTapOkButton() {
        inputNumberTextField.resignFirstResponder()
    }
    
}

// MARK: - UITextFieldDelegate
extension Guess1ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let userNumber = Int(inputNumberTextField.text ?? "0") else {
             return
         }
        
        checkInput(userNumber: userNumber)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

}
