//
//  RecordsHistory.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 01.04.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

enum GameType {
    case guess1
    case guess2
}

class RecordsHistoryService {
    
    // MARK: - Properties
    private var records: [GameType: [RecordModel]] = [.guess1:[], .guess2:[]]
    
    
    // MARK: - Public methods
    func addReсord(gameType: GameType, record: RecordModel) {
        guard records[gameType] != nil else {
            assert(false)
            return
        }
        
        records[gameType]!.append(record)
    }
    
    func getRecords(gameType: GameType) -> [RecordModel] {
        guard records[gameType] != nil else {
            assert(false)
            return []
        }
        
        return records[gameType]!
    }
    
}
