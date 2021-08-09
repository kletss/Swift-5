//
//  GameSession.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 07.08.2021.
//

import Foundation

//class GameSession {
//    var summa: Int = 0
//    var countQuestion: Int = 0
//    var correctAnswer: Int = 0
//    var correctProc: Double = 0
//    var date: Date = Date()
//
//}

// 1. Originator
struct GameSession: Codable {
    var summa: Int
    var countQuestion: Int
    var correctAnswer: Int
    var date: Date
    var fifty: Bool?
    var endGame: Bool?
    
}

// 3. Caretaker
final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func saveRecords(records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
