//
//  Question.swift
//  Who Wants to Be a Millionaire
//
//  Created by KKK on 06.08.2021.
//

import Foundation


struct Answer: Codable {
    var answer: String
    var correct: Bool
}

struct Question: Codable {
    var summa: Int
    var question: String
    var answers: [Answer]
}

enum QuestionUses: String {
    case normal = "по порядку"
    case random = "случайно"
}
