//
//  RecordHistoryServiceProtocol.swift
//  Two in one
//
//  Created by Мирошниченко Марина on 11.04.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

protocol RecordHistoryServiceProtocol {
    func addReсord(gameType: GameType, record: RecordModel)
    func getRecords(gameType: GameType) -> [RecordModel]
}
