//
//  RecordsViewController.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 31.03.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class RecordsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private var recordsTableView: UITableView!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    
    var recordHistory: RecordsHistory?
    private var recordItems: [RecordModel]?
    
    // MARK: - Public methods
     override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Records"
        recordsTableView.register(UINib(nibName: "RecordCell", bundle: nil), forCellReuseIdentifier: "RecordCell")
        recordItems = recordHistory?.guess1Records
     }

    // MARK: - Private methods
    @IBAction private func didChangedGame(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            recordItems = recordHistory?.guess1Records
        case 1:
            recordItems = recordHistory?.guess2Records
        default:
            recordItems = []
        }
        recordsTableView.reloadData()
    }
    
    @IBAction private func didTapSortButton() {
        let alert = UIAlertController(title: "Sorting", message: "How would you like to sort?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "descending number of tries", style: .default) {[weak self] action -> Void in
            self?.sortDescendingTriesNumber()})
            
        alert.addAction(UIAlertAction(title: "descending guessed number", style: .default) {[weak self] action -> Void in
            self?.sortDescendindGuessedNumber()})
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
        present(alert, animated: true)
    }
    
    private func sortDescendingTriesNumber() {
        recordItems?.sort{$0.triesCount > $1.triesCount}
        recordsTableView.reloadData()
    }
    
    private func sortDescendindGuessedNumber() {
        recordItems?.sort{$0.guessedNumber > $1.guessedNumber}
        recordsTableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource
extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell") as! RecordCell
        
        guard let records = recordItems else {
            return UITableViewCell()
        }
        cell.setRecordLabelText(triesCount: records[indexPath.row].triesCount, guessedNumber: records[indexPath.row].guessedNumber)
        
        return cell
    }
    
}
