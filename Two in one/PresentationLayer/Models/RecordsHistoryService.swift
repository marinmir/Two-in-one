//
//  RecordsHistory.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 01.04.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

enum GameType: String, Codable {
    case guess1
    case guess2
}

class RecordsHistoryService {
    
    // MARK: - Properties
    private var records: [GameType: [RecordModel]] = [.guess1:[], .guess2:[]]
    
    // MARK: - Public methods
    init() {
        if let savedRecords = UserDefaults.standard.object(forKey: "SavedRecords") as? Data {
            let decoder = JSONDecoder()
            if let loadedRecords = try? decoder.decode([GameType: [RecordModel]].self, from: savedRecords) {
                records = loadedRecords
            }
        }
    }
    
}

extension RecordsHistoryService: RecordHistoryServiceProtocol {
    
    // MARK: - Public methods
    func addReсord(gameType: GameType, record: RecordModel) {
        guard records[gameType] != nil else {
            assert(false)
            return
        }
        
        records[gameType]!.append(record)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(records) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedRecords")
        }
    }
    
    func getRecords(gameType: GameType) -> [RecordModel] {
        guard records[gameType] != nil else {
            assert(false)
            return []
        }
        
        return records[gameType]!
    }
    
}
