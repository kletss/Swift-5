//
//  SingletonQuestionsUser.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 11.08.2021.
//

import Foundation


// 3. Caretaker
class SingletonQuestionsUser  {
    
    static let quest = SingletonQuestionsUser()
        
    private let questCaretaker = QuestUserCaretaker()
    
    private(set) var questionsUser: [Question] {
        didSet {
            questCaretaker.saveRecords(quest: self.questionsUser)
        }
    }
    
    private init() {
        self.questionsUser = self.questCaretaker.retrieveRecords()
    }
    
    
    func addQuestion(quest: Question) {
        questionsUser.append(quest)
    }
    
    
    func dropQuestion(result: Question) {
        questionsUser.removeAll()
    }
    
}
