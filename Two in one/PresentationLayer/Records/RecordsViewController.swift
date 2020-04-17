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
    
    var recordHistoryService: RecordsHistoryService?
    private var recordItems: [RecordModel]?
    
    // MARK: - Public methods
     override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Records"
        recordsTableView.register(UINib(nibName: "RecordCell", bundle: nil), forCellReuseIdentifier: "RecordCell")
        recordItems = recordHistoryService?.getRecords(gameType: .guess1)
     }

    // MARK: - Private methods
    @IBAction private func didChangedGame(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            recordItems = recordHistoryService?.getRecords(gameType: .guess1)
        case 1:
            recordItems = recordHistoryService?.getRecords(gameType: .guess2)
        default:
            recordItems = []
        }
        recordsTableView.reloadData()
    }
    
    @IBAction private func didTapSortButton() {
        let alert = UIAlertController(title: "Sorting", message: "How would you like to sort?", preferredStyle: .actionSheet)
        
        let descendingTriesNumberPredicate: (RecordModel, RecordModel) -> Bool = {$0.triesCount > $1.triesCount}
        let descendingTriesNumberAction = UIAlertAction(title: "Descending number of tries", style: .default) {[weak self] _ -> Void in
            self?.sortRecords(by: descendingTriesNumberPredicate)
        }
        alert.addAction(descendingTriesNumberAction)
        
        let descendingGuessedNumberPredicate: (RecordModel, RecordModel) -> Bool = {$0.guessedNumber > $1.guessedNumber}
        let descendingGuessedNumberAction = UIAlertAction(title: "Descending guessed number", style: .default) {[weak self] _ -> Void in
        self?.sortRecords(by: descendingGuessedNumberPredicate)
        }
        alert.addAction(descendingGuessedNumberAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
        present(alert, animated: true)
    }
    
    private func sortRecords(by predicate: @escaping (RecordModel, RecordModel) -> Bool) {
        recordItems?.sort(by: predicate)
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
