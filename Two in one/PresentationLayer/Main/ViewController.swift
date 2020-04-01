//
//  ViewController.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 18.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    // MARK: - Properties
    private var recordsHistory = RecordsHistory()

    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private methods
    @IBAction private func showGuess1View() {
        let guess1vc = Guess1ViewController(nibName: "Guess1", bundle: nil)
        guess1vc.recordHistory = recordsHistory
        navigationController?.pushViewController(guess1vc, animated: true)
    }
    
    @IBAction private func showGuess2View() {
        let guess2Storyboard = UIStoryboard(name: "Guess2", bundle: nil)
        let vc = guess2Storyboard.instantiateViewController(identifier: "Guess2VC") as! Guess2ViewController
        vc.recordHistory = recordsHistory
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func showRecordsView() {
        let recordsVC = RecordsViewController(nibName: "Records", bundle: nil)
        recordsVC.recordHistory = recordsHistory
        navigationController?.pushViewController(recordsVC, animated: true)
    }

}
