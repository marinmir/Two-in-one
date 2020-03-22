//
//  ViewController.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 18.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction
    func showGuess1View() {
        let guess1vc = Guess1ViewController(nibName: "Guess1", bundle: nil)
        navigationController?.pushViewController(guess1vc, animated: true)
    }
    
    @IBAction
    func showGuess2View() {
        let guess2Storyboard = UIStoryboard(name: "Guess2", bundle: nil)
        let vc = guess2Storyboard.instantiateViewController(identifier: "Guess2VC") as! Guess2ViewController
        navigationController?.pushViewController(vc, animated: true)
    }

}
