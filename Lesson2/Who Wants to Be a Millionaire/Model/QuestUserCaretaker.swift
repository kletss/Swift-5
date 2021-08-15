//
//  QuestUserCaretaker.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 11.08.2021.
//

import Foundation

final class QuestUserCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "questUser"
    
    func saveRecords(quest: [Question]) {
        do {
            let data = try self.encoder.encode(quest)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
