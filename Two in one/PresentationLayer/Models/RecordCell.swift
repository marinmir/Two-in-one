//
//  RecordCell.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 01.04.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private var recordLabel: UILabel!
    
    // MARK: - Public methods
    func setRecordLabelText(triesCount count: Int,
                            guessedNumber number: Int) {
        recordLabel.text = "Tries count: \(count), guessed number: \(number)"
    }
    
}
