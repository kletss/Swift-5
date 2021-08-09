//
//  SingletonGame.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 07.08.2021.
//

import Foundation

class SingletonGame  {
    
    static let game = SingletonGame()
        
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [GameSession] {
        didSet {
            recordsCaretaker.saveRecords(records: self.records)
        }
    }
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
    }
    
    
    func addResult(result: GameSession) {
        records.append(result)
    }
    
    
    func clearResult() {
        records.removeAll()
    }
    
}
